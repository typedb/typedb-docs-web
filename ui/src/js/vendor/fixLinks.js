document.querySelectorAll("div.body a[href^='/']").forEach(x => { x.href = `/docs${x.attributes.href}` });
