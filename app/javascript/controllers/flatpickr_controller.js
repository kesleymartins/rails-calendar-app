import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr'

export default class extends Controller {
    connect() {
        flatpickr('.datetime-input', {
            enableTime: true,
            dateFormat: "d-m-Y H:i",
        })

        flatpickr('.date-input', {
            dateFormat: "d-m-Y H:i",
        })
    }
}