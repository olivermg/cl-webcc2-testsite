;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(in-package :cl-user)

(defpackage #:testsite-asd
  (:use :cl :asdf))

(in-package :testsite-asd)

(defsystem testsite
  :name "testsite"
  :version "0.0.1"
  :maintainer "Oliver Wegner <void1976@gmail.com>"
  :author "Oliver Wegner <void1976@gmail.com"
  :licence "BSD"
  :description "testsite"
  :depends-on (:cl-webcc2
	       :cl-wegner
	       :hunchentoot
	       :cl-emb
	       :cl-who)
  :components ((:file "packages")
	       (:module src
			:components ((:file "entities")
				     (:file "templates"
					    :depends-on ("entities"))
				     (:file "router"
					    :depends-on ("templates")))
			:depends-on ("packages"))))
