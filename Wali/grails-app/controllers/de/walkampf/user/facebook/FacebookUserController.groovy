package de.walkampf.user.facebook

import org.springframework.dao.DataIntegrityViolationException

import de.walkampf.user.facebook.FacebookUser;

class FacebookUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [facebookUserInstanceList: FacebookUser.list(params), facebookUserInstanceTotal: FacebookUser.count()]
    }

    def create() {
        [facebookUserInstance: new FacebookUser(params)]
    }

    def save() {
        def facebookUserInstance = new FacebookUser(params)
        if (!facebookUserInstance.save(flush: true)) {
            render(view: "create", model: [facebookUserInstance: facebookUserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), facebookUserInstance.id])
        redirect(action: "show", id: facebookUserInstance.id)
    }

    def show(Long id) {
        def facebookUserInstance = FacebookUser.get(id)
        if (!facebookUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), id])
            redirect(action: "list")
            return
        }

        [facebookUserInstance: facebookUserInstance]
    }

    def edit(Long id) {
        def facebookUserInstance = FacebookUser.get(id)
        if (!facebookUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), id])
            redirect(action: "list")
            return
        }

        [facebookUserInstance: facebookUserInstance]
    }

    def update(Long id, Long version) {
        def facebookUserInstance = FacebookUser.get(id)
        if (!facebookUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (facebookUserInstance.version > version) {
                facebookUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'facebookUser.label', default: 'FacebookUser')] as Object[],
                          "Another user has updated this FacebookUser while you were editing")
                render(view: "edit", model: [facebookUserInstance: facebookUserInstance])
                return
            }
        }

        facebookUserInstance.properties = params

        if (!facebookUserInstance.save(flush: true)) {
            render(view: "edit", model: [facebookUserInstance: facebookUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), facebookUserInstance.id])
        redirect(action: "show", id: facebookUserInstance.id)
    }

    def delete(Long id) {
        def facebookUserInstance = FacebookUser.get(id)
        if (!facebookUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), id])
            redirect(action: "list")
            return
        }

        try {
            facebookUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'facebookUser.label', default: 'FacebookUser'), id])
            redirect(action: "show", id: id)
        }
    }
}
