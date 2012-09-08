package com.draco.timekeeper

import org.springframework.dao.DataIntegrityViolationException

class TimeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [timeInstanceList: Time.list(params), timeInstanceTotal: Time.count()]
    }

    def create() {
        [timeInstance: new Time(params)]
    }

    def save() {
        def timeInstance = new Time(params)
        if (!timeInstance.save(flush: true)) {
            render(view: "create", model: [timeInstance: timeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'time.label', default: 'Time'), timeInstance.id])
        redirect(action: "show", id: timeInstance.id)
    }

    def show(Long id) {
        def timeInstance = Time.get(id)
        if (!timeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'time.label', default: 'Time'), id])
            redirect(action: "list")
            return
        }

        [timeInstance: timeInstance]
    }

    def edit(Long id) {
        def timeInstance = Time.get(id)
        if (!timeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'time.label', default: 'Time'), id])
            redirect(action: "list")
            return
        }

        [timeInstance: timeInstance]
    }

    def update(Long id, Long version) {
        def timeInstance = Time.get(id)
        if (!timeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'time.label', default: 'Time'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (timeInstance.version > version) {
                timeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'time.label', default: 'Time')] as Object[],
                          "Another user has updated this Time while you were editing")
                render(view: "edit", model: [timeInstance: timeInstance])
                return
            }
        }

        timeInstance.properties = params

        if (!timeInstance.save(flush: true)) {
            render(view: "edit", model: [timeInstance: timeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'time.label', default: 'Time'), timeInstance.id])
        redirect(action: "show", id: timeInstance.id)
    }

    def delete(Long id) {
        def timeInstance = Time.get(id)
        if (!timeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'time.label', default: 'Time'), id])
            redirect(action: "list")
            return
        }

        try {
            timeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'time.label', default: 'Time'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'time.label', default: 'Time'), id])
            redirect(action: "show", id: id)
        }
    }
}
