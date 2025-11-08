CHART_DIRECTORY_PATH = chart.d
HELM_REPO_URL = https://jnnkrdb.github.io/helm/
CHART_DEV_DIRS = $(wildcard .dev/chartd/*)

index:
	helm repo index --url $(HELM_REPO_URL) . 

depupall: 
	$(foreach v,$(CHART_DEV_DIRS),echo "===== Dependency Update: $(v)" && make dep -C $(v);)

lintall: depupall
	$(foreach v,$(CHART_DEV_DIRS),echo "===== Linting: $(v)" && make lint -C $(v);)

packageall: lintall
	$(foreach v,$(CHART_DEV_DIRS),echo "===== Package: $(v)" && make package -C $(v);)