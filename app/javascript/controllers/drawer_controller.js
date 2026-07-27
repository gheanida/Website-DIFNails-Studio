import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  open() {
    // dipanggil saat turbo-frame selesai load
  }

  close(event) {
    if (event) event.preventDefault()
    const drawer = document.getElementById("detail-drawer-wrapper")
    if (drawer) drawer.remove()
  }
}