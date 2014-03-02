(provide 'workonomic)
;
; This is a simple plugin for Workonomic.cc
;
; if expects that you have your workonomic api-token in ~/.config/workonomic/.apitoken
; and you do have it if you installed the Workonomic bash client.
;
; Please also install http-post-simple.el for this to work

; examples of usage: 
;
; M-x wrknm (workonomic message -- the nat.lang. interface)
;
; show my projects
; create new project abc
; i started working on abc 20 mins ago
; pause
; continue
; note: I fixed the bug
; stopped at 4pm

(require 'http-post-simple)

(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(defun http-post-simple-2 (url fields &optional charset bufname)
  "Send FIELDS to URL as an HTTP POST request, returning the response
   and response headers.
   FIELDS is an alist, eg ((field-name . \"value\")); all values
   need to be strings, and they are encoded using CHARSET,
   which defaults to 'utf-8"
  (let (request-result)
    (setq request-result (http-post-simple-internal
			  url
			  (http-post-encode-fields fields charset)
			  charset
			  `(("Content-Type"
			     .
			     ,(http-post-content-type
			       "application/x-www-form-urlencoded"
			       charset)))))
    ;; set buffername
    (unless bufname (setq bufname
			  (format "*HTTP POST %s *" url)))
    (save-excursion
      (delete-other-windows) ;; bury other window
      (split-window-vertically) ;; split window vertically
      ;; switch to window for HTTP output
      (pop-to-buffer (get-buffer-create bufname))
      (insert (mapconcat '(lambda(x)
			    (if (integerp x)
				(int-to-string x)
			      (identity x)))
			 (nreverse request-result) "\n"))
      (beginning-of-buffer))
    ))

					;(http-post-simple-2 "http://workonomic.cc/APIBOT" '((msg . "hi")))

(defun http-post-simple-wauth (url user pwd fields &optional charset)
  "Send FIELDS to URL as an HTTP POST request, returning the response
			and response headers.
			FIELDS is an alist, eg ((field-name . \"value\")); all values
			need to be strings, and they are encoded using CHARSET,
			which defaults to 'utf-8"
  (http-post-simple-internal
   url
   (http-post-encode-fields fields charset)
   charset
   `(("Content-Type"
      .
      ,(http-post-content-type
	"application/x-www-form-urlencoded"
	charset))
     ("Authorization" . ,(concat "Basic "
				 (base64-encode-string
				  (concat user ":" pwd))))
     )))


					;(http-post-simple-wauth "http://workonomic.cc/APIBOT" "xascasas" "x" '((msg . "hi")) )

(defun wrknm(msg)
  (interactive "sMessage: \n")
  (let ((api-token (first (read-lines "~/.config/workonomic/.apitoken"))))
    (message (first (http-post-simple-wauth "http://workonomic.cc/APIBOT" api-token "x" `((msg . ,msg)))))))

					;(wrknm "list projs")

