PROJECT = dgiot_parse
PROJECT_DESCRIPTION = dgiot_parse

CUR_BRANCH := $(shell git branch | grep -e "^*" | cut -d' ' -f 2)
BRANCH := $(if $(filter $(CUR_BRANCH), master develop), $(CUR_BRANCH), develop)

BUILD_DEPS = cuttlefish
dep_cuttlefish = git-emqx https://github.com/emqx/cuttlefish v2.2.1

ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

include erlang.mk

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/dgiot_parse.conf -i priv/dgiot_parse.schema -d data
