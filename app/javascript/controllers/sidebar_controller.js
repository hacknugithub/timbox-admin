import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "menuLink"]

  connect() {
    this.highlightActiveLink()
  }

  selectMenuItem(event) {
    this.setActiveLink(event.currentTarget)
  }

  highlightActiveLink() {
    const currentPath = window.location.pathname

    this.menuLinkTargets.forEach((link) => {
      const href = link.getAttribute("href")
      if (href && currentPath === href) {
        this.setActiveLink(link)
      }
    })
  }

  setActiveLink(link) {
    this.menuLinkTargets.forEach((item) => {
      item.classList.remove("active", "fw-bold", "bg-primary", "text-white")
      item.classList.add("link-dark")
      item.removeAttribute("aria-current")
    })

    link.classList.add("active", "fw-bold", "bg-primary", "text-white")
    link.classList.remove("link-dark")
    link.setAttribute("aria-current", "page")
  }
}