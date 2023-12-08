import "typedb-web-common/lib/prism";
import { initCustomScrollbars } from "typedb-web-common/lib/scrollbars";
import { setupTopbarListeners } from "typedb-web-common/lib/topbar/setup-topbar-listeners";
setupTopbarListeners();
document.querySelectorAll(".nav .panels, .doc .listingblock .content pre").forEach(initCustomScrollbars);
