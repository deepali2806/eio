(lang dune 2.9)
(name eio)
(formatting disabled)
(generate_opam_files true)
(source (github ocaml-multicore/eio))
(license ISC)
(authors "Anil Madhavapeddy" "Thomas Leonard")
(maintainers "anil@recoil.org")
(documentation "https://ocaml-multicore.github.io/eio/")
(package
 (name eio)
 (synopsis "Effect-based direct-style IO API for OCaml")
 (description "An effect-based IO API for multicore OCaml with fibers.")
 (depends
  (ocaml (>= 4.12.0))
  base-domains
  (cstruct (>= 6.0.1))
  lwt-dllist
  (optint (>= 0.1.0))
  (psq (>= 0.2.0))
  (fmt (>= 0.8.9))
  (astring (and (>= 0.8.5) :with-test))
  (crowbar (and (>= 0.2) :with-test))
  (mtime (>= 1.2.0))
  (alcotest (and (>= 1.4.0) :with-test))))
(package
 (name eio_linux)
 (synopsis "Eio implementation for Linux using io-uring")
 (description "An eio implementation for Linux using io-uring.")
 (depends
  (alcotest (and (>= 1.4.0) :with-test))
  base-domains
  (eio (= :version))
  (mdx (and (>= 1.10.0) :with-test))
  (logs (>= 0.7.0))
  (fmt (>= 0.8.9))
  (cmdliner (and (>= 1.1.0) :with-test))
  (uring (>= 0.3))))
(package
 (name eio_luv)
 (synopsis "Eio implementation using luv (libuv)")
 (description "An eio implementation for most platforms, using luv.")
 (depends
  base-domains
  (eio (= :version))
  (luv (>= 0.5.11))
  (luv_unix (>= 0.5.0))
  (mdx (and (>= 1.10.0) :with-test))
  (logs (>= 0.7.0))
  (fmt (>= 0.8.9))))
(package
 (name eio_main)
 (synopsis "Effect-based direct-style IO mainloop for OCaml")
 (description "Selects an appropriate Eio backend for the current platform.")
 (depends
  (eio_linux (and (= :version) (= :os "linux")))
  (mdx (and (>= 1.10.0) :with-test))
  (eio_luv (= :version))))
(using mdx 0.1)
