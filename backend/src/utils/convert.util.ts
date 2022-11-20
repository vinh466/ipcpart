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