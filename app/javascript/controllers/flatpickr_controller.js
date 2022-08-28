import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr'

export default class extends Controller {
    connect() {
        flatpickr(this.element, {
            enableTime: true,
            dateFormat: "d-m-Y H:i",
            defaultDate: this.buildDefaultDate(this.element)
        })
    }

    buildDefaultDate(element) {
        const currentDate = element.value

        return currentDate ? new Date(currentDate) : new Date()
    }
}