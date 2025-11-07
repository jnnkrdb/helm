CHART_PATH = .
LOCAL_DEPS_PATH = $(wildcard dependencies/*/)
PACKAGE_DESTINATION = ../../../chart.d

all: lint template package

# dependency tasks
dep:
	$(foreach v,$(LOCAL_DEPS_PATH),echo "$(v)" && helm dep up $(v)/;)
	helm dep up $(CHART_PATH)/

# helm testing
lint: dep
	helm lint $(CHART_PATH)/

template: dep
	helm template --debug $(CHART_PATH)/

package: dep
	helm package $(CHART_PATH)/ --destination $(PACKAGE_DESTINATION)