(in-package #:testsite)

(export '())

(defparameter *acc* (make-instance 'cc-acceptor
				   :port 9999
				   :persistent-connections-p nil
				   :document-root (asdf:system-relative-pathname :testsite
										 #p"pub")))


(register-emb "/dashboard" (asdf:system-relative-pathname :testsite
							  #p"templates/dashboard.t"))

(register-emb "/login" (asdf:system-relative-pathname :testsite
						      #p"templates/login.t"))

(define-cc-handler
    (dashboard :uri "/dashboard")
    ()
  #|
  (if (equalp (header-in "X-REQUESTED-WITH" *request*)
	      "XMLHttpRequest")
      (format t "AJAX~%")
      (format t "GET/POST~%"))
  |#
  (execute-emb "/dashboard"))

(define-cc-handler
    (login :uri "/login")
    ()
  (let ((data (read-loginform)))
    (if (equalp (loginform-user data)
		"oliver")
	"oliver logged in!"
	"unknown user")))
