PROJ := $(strip $(word 2, $(shell grep defproject project.clj )))
PROJ_VERSION := $(strip $(subst \", , $(word 3, $(shell grep defproject project.clj ))))
ERL_VERSION := $(shell erl -eval "io:format(erlang:system_info(system_version)),halt()" -noshell)
ERL_LIBS := $(shell erl -eval "io:format(code:root_dir()),halt()" -noshell)
JINTERFACE := $(shell ls -1 $(ERL_LIBS)/lib/|grep jinterface)
JINTERFACE_VER := $(strip $(subst \", , $(word 2, $(subst -, , $(JINTERFACE)))))
JINTERFACE_FILES := $(ERL_LIBS)/lib/jinterface-$(JINTERFACE_VER)/java_src/com/ericsson/otp/erlang/*.java
CLOJURE_DEP := $(strip $(shell grep "org.clojure/clojure" project.clj))
CLOJURE_VER := $(subst ], , $(word 3, $(CLOJURE_DEP)))
JAR := $(PROJ)-$(VERSION).jar
UBERJAR := $(PROJ)-$(VERSION)-standalone.jar
LOCAL_MAVEN := ~/.m2/repository
REPO = $(shell git config --get remote.origin.url)

include dev-resources/make/code.mk
include dev-resources/make/clj.mk
include dev-resources/make/lfe.mk
include dev-resources/make/test.mk
include dev-resources/make/docs.mk
