// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your Javascript code.

window.addEventListener("scroll", e => {
    var scroll = this.scrollY;

    var tableOfContent = document.getElementById("table-of-contents-holder");
    console.log(scroll)
    if (scroll > 55) {
        console.log("setting to 24")
        tableOfContent.classList.remove("has-not-scrolled")
        tableOfContent.classList.add("scrolled-down")
    }
    else {
        tableOfContent.classList.remove("scrolled-down")
        tableOfContent.classList.add("has-not-scrolled")
    }
})

function expand(e) {
    let clazz = "is-expanded"
    if (e.classList.contains(clazz)) {
        e.classList.remove(clazz)
        console.log("removing");
    }
    else {
        e.classList.add(clazz)
        console.log("added");
    }
}