import "typedb-web-common/lib/prism";
import { initCustomScrollbars } from "typedb-web-common/lib/scrollbars";
import { setupTopbarListeners } from "typedb-web-common/lib/topbar/setup-topbar-listeners";
setupTopbarListeners();
document.querySelectorAll(".doc .listingblock .content pre").forEach(initCustomScrollbars);
