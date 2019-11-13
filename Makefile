REBAR3=./rebar3

##
## define the default release path in order to
## manage the core system. The release must be generated
## before try to start using `make rel`.
## TODO: Check if after creation release could be
## moved to another dir for easy access.
##
RELEASE_PATH=_build/default/rel/oox/bin

##
## define the main script that controls 
## the management of the release.
##
OOX=oox

.PHONY: oox compile all doc test

all: compile

compile:
	$(REBAR3) compile

clean:
	$(REBAR3) clean

rel:
	$(REBAR3) release

run:
	@sh $(RELEASE_PATH)/$(OOX) start

live:
	@sh $(RELEASE_PATH)/$(OOX) console

stop:
	@sh $(RELEASE_PATH)/$(OOX) stop

test:
	$(REBAR3) ct --cover
	$(REBAR3) cover
	$(REBAR3) covertool generate
	@mv _build/test/covertool/jun.covertool.xml cobertura.xml

cover:
	$(REBAR3) cover
