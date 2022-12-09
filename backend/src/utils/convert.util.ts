/**
 * Convert an object to a nested object that follows the key format (only up to 4 levels)
 * 
 * e.g: {'one.tow.three': value} -> {one:{two:{three: value}}}
 * @param  obj object need convert ()
 * @param  format key format, default '.'
 * @returns new object nested
 */
export function nestedConvert<T>(obj: any, format = '.') {
    let nestedOjb: { [key: string]: any } = {};

    for (let [key, value] of Object.entries(obj)) {
        const keyArr = key.split(format);
        if (keyArr.length === 2) {
            if (nestedOjb[keyArr[0]]) {
                nestedOjb[keyArr[0]][keyArr[1]] = value
            } else {
                nestedOjb[keyArr[0]] = {}
                nestedOjb[keyArr[0]][keyArr[1]] = value
            }
        } else
            if (keyArr.length === 3) {
                if (nestedOjb[keyArr[0]]) {
                    if (nestedOjb[keyArr[0]][keyArr[1]]) {
                        nestedOjb[keyArr[0]][keyArr[1]][keyArr[2]] = value
                    } else {
                        nestedOjb[keyArr[0]][keyArr[1]] = {}
                        nestedOjb[keyArr[0]][keyArr[1]][keyArr[2]] = value
                    }
                } else {
                    nestedOjb[keyArr[0]] = {}
                    nestedOjb[keyArr[0]][keyArr[1]] = {}
                }
            } else
                if (keyArr.length === 4) {
                    if (nestedOjb[keyArr[0]]) {
                        if (nestedOjb[keyArr[0]][keyArr[1]]) {
                            if (nestedOjb[keyArr[0]][keyArr[1]][keyArr[2]]) {
                                nestedOjb[keyArr[0]][keyArr[1]][keyArr[2]][keyArr[3]] = value
                            }
                            else {
                                nestedOjb[keyArr[0]][keyArr[1]][keyArr[2]] = {}
                                nestedOjb[keyArr[0]][keyArr[1]][keyArr[2]][keyArr[3]] = value
                            }
                        } else {
                            nestedOjb[keyArr[0]][keyArr[1]] = {}
                            nestedOjb[keyArr[0]][keyArr[1]][keyArr[2]] = {}
                        }
                    } else {
                        nestedOjb[keyArr[0]] = {}
                        nestedOjb[keyArr[0]][keyArr[1]] = {}
                    }
                } else
                    nestedOjb[key] = value
    }
    return nestedOjb as T;
}
/**
 * Convert req query String -> Array 
 * @param object 
 * @returns Array
 */
export const convertStringToArray = (object: string | string[] | undefined) => {
    return (typeof object === 'string') ? Array(object) : object
}
/**
 * Convert to WHERE REGEXP query in mysql from string array
 * @param object 
 * @returns 
 */
export const convertRegexpQuery = (value: string[] | string) => {
    let result = ''
    if (typeof value == 'string') return value
    if (value?.length > 0) {
        value.forEach((item, index) => {
            if (index == 0) result += item;
            else result += `|${item}`
        })
    }
    return result;
}
export function extractData<T extends Object | Array<any>>(payload: Object | Array<any>): T {
    // Remove undefined fields
    Object.keys(payload).forEach((key) => {
        const objValue = payload[key as keyof typeof payload]
        if (objValue === undefined ||
            (typeof objValue === 'string' && objValue === '')
        ) {
            delete payload[key as keyof typeof payload]
        }
    }
    );
    return payload as T;
}
export function convertSetUpdateQuery(updateData: Object): string {
    updateData = extractData(updateData);
    const setQuery = Object.entries(updateData).map((entry) => {
        let [key, value] = entry;
        if (key.split('.').length > 1) {
            key = key.replaceAll('.', '`.`')
        }
        return `\`${key}\`='${value}'`
    })
    return setQuery.join(',')
}


const convertWhereQuery__Backup = (payload: Array<{
    col: string;
    value: string | string[] | undefined;
    operator: string;
    sqlLogical: string;

}>) => {
    let result = ''
    payload = payload.filter((value, index) => {
        return !(
            value.value === undefined ||
            (typeof value.value === 'string' && value.value === '')
        )
    })
    console.log(payload);
    if (payload.length > 0) {
        payload.forEach((value, index) => {
            if (value.value) {
                console.log(value);
                if (value.col.split('.').length > 1) {
                    value.col = value.col.replaceAll('.', '`.`')
                }
                result += `\`${value.col}\``
                if (value.operator == 'eq' && typeof value.value == 'string') result += ` = '${value.value}'`
                if (value.operator == 'eq' && typeof value.value == 'number') result += ` = ${value.value}`
                if (value.operator == 'is') result += ' IS ' + value.value
                else if (value.operator == 'REGEXP') result += ` REGEXP '${convertRegexpQuery(value.value as string[])}'`
                if (index + 1 < payload.length) result += ` ${value.sqlLogical} `
            }
        })
        if (result) result = `WHERE ${result}`
    }
    return result;
}

type WhereQueryOperator = 'eq' | 'lt' | 'gt' | 'REGEXP' | 'is'
interface RawWhereQuery {
    col: string;
    value: string | string[] | undefined;
    operator: WhereQueryOperator;
    sqlLogical: string;
}
interface WhereQuery {
    query: string;
    lastLogical: string;
}
const getWhereQuery = (payload: Array<RawWhereQuery | WhereQuery>): WhereQuery => {
    let result = "";
    let lastLogical = "";
    payload = payload.filter((value, index) => {
        if (
            !((value as RawWhereQuery).value === undefined
                || (typeof (value as RawWhereQuery).value === "string"
                    && (value as RawWhereQuery).value === "")
            ) || typeof (value as WhereQuery).query === "string" && (value as WhereQuery).query !== ""
        ) return true; else return false
    });
    //   console.log(payload);
    if (payload.length > 0) {
        payload.forEach((value, index) => {
            if ((value as RawWhereQuery).value) {
                const rawValue = value as RawWhereQuery
                if (rawValue.col.split(".").length > 1) {
                    rawValue.col = rawValue.col.replaceAll(".", "`.`");
                }
                result += `\`${rawValue.col}\``;
                if (rawValue.operator == "eq" && typeof rawValue.value == "string")
                    result += ` = '${rawValue.value}'`;
                if (rawValue.operator == "eq" && typeof rawValue.value == "number")
                    result += ` = ${rawValue.value}`;
                if (rawValue.operator == "is") result += " IS " + rawValue.value;
                if (rawValue.operator == "REGEXP")
                    result += ` REGEXP '${convertRegexpQuery(rawValue.value as string)}'`;
                if (index + 1 < payload.length) result += ` ${rawValue.sqlLogical} `;
                else lastLogical = rawValue.sqlLogical;
            } else {
                value = value as WhereQuery
                if (value.query) {
                    result += ` (${value.query})`;
                    if (index + 1 < payload.length) result += ` ${value.lastLogical} `;
                }
            }
        });
    }
    return { query: result, lastLogical };
};

function rawToWhereQuery(payload: Array<RawWhereQuery | RawWhereQuery[]>): WhereQuery {
    return getWhereQuery(
        payload.map((v) => {
            if ((v as RawWhereQuery[]).length) {
                return rawToWhereQuery(v as RawWhereQuery[]);
            } else return v as RawWhereQuery;
        })
    );
}
/**
 *  ```js
 * const query = [ 
 *     {col: 'col1',value: 'NULL', operator: 'is', sqlLogical: 'AND'},
 *     {col: 'tab.col',value: 'value', operator: 'eq', sqlLogical: 'AND'},
 *     [ 
 *       {col: 'col2',value: 'value', operator: 'eq', sqlLogical: 'OR'},
 *       {col: 'col3',value: 'value', operator: 'eq', sqlLogical: 'OR'} 
 *     ],
 *     {col: 'col4',value: ['value1','value2'], operator: 'REGEXP', sqlLogical: 'AND'},
 * ]
 * console.log(convertWhereQuery(query));
 * ```
 * ```sql
 *   => WHERE
 *        `col1` IS NULL
 *         AND `tab`.`col` = 'value'
 *         AND (
 *             `col2` = value
 *             OR `col3` = value
 *         )
 *         OR `col4` REGEXP 'value1|value2'
 * ```
 * @param payload array of conditions for MySQL WHERE QUERY
 * @returns a MySQL WHERE QUERY string
 */
export function convertWhereQuery(payload: Array<RawWhereQuery | RawWhereQuery[]>): string {
    const query = rawToWhereQuery(payload).query
    if (query) return 'WHERE ' + query;
    else return ''
}