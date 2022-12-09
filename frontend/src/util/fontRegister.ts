/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core'

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

/* import specific icons */
import {
    faSun as fasSun,
    faStar as fasStar,
    faUserSecret,
    faXmark,
    faCopy,
    faRightFromBracket,
    faMoon,
    faCartArrowDown,
    faEye,
    faChevronLeft,
    faChevronRight,
    faCartShopping,
    faSpinner, faList, faRotateLeft, faCaretUp, faUserTie, faTableColumns, faClipboardCheck, faTags, faUser as fasUser,
    faPenToSquare, faTrash, faPlus

} from '@fortawesome/free-solid-svg-icons'
import {
    faFacebookF,
    faFacebook,
    faGoogle,
    faTwitter,
    faGithub,
    faYoutube,


} from '@fortawesome/free-brands-svg-icons';
import { faStar, faUser, faCircleXmark, faTrashAlt, faCopy as farCopy } from '@fortawesome/free-regular-svg-icons';

// faFacebook
// faGoogle
// faTwitter
// faGithub

/* add icons to the library */
library.add(
    faEye, faCopy,
    faFacebookF, faRightFromBracket,
    faCircleXmark,
    faXmark,
    faFacebook,
    faGoogle,
    faGithub,
    faTwitter,
    faYoutube,
    faCartArrowDown,
    faCartShopping,
    faSpinner,
    faList, faPlus,
    faRotateLeft, faCaretUp, faUserTie, faTableColumns, faClipboardCheck, faTags, fasUser, faTrash
);
library.add(fasStar, fasSun, faMoon, faUserSecret, faChevronLeft, faChevronRight);
library.add(faStar, faUser, faPenToSquare, faTrashAlt, farCopy);

export { FontAwesomeIcon }