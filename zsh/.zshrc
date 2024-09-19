# ___  ___       ______             _____      _               
# |  \/  |       |  _  \           /  ___|    | |              
# | .  . |_   _  | | | |_____   __ \ `--.  ___| |_ _   _ _ __  
# | |\/| | | | | | | | / _ \ \ / /  `--. \/ _ \ __| | | | '_ \ 
# | |  | | |_| | | |/ /  __/\ V /  /\__/ /  __/ |_| |_| | |_) |
# \_|  |_/\__, | |___/ \___| \_/   \____/ \___|\__|\__,_| .__/ 
#          __/ |                                        | |    
#         |___/                                         |_|    
# 
# 
# By Ozan Öztürk (2024) 


# Use Oh My Posh (if not apple terminal)
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/catppuccin_frappe.omp.json')"
fi
# store cache files in custom path to not clutter my homefolder
export OMP_CACHE_PATH="$HOME/.cache/oh-my-posh"


# Use NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"


# 1password
eval "$(op completion zsh)"; compdef _op op

# alias code-insiders -> code
alias code="code-insiders"




# ______           _    _            _    
# |  ___|         | |  | |          | |   
# | |_ ___  _ __  | |  | | ___  _ __| | __
# |  _/ _ \| '__| | |/\| |/ _ \| '__| |/ /
# | || (_) | |    \  /\  / (_) | |  |   < 
#\_| \___/|_|     \/  \/ \___/|_|  |_|\_\
#                                         
#
#
# H&D Unternehmensberatung GmbH

##### ADDED FROM H&D NOT USE IN PRIVATE SETUP ######
# Uncomment this line if you are working in the auslaenderwesen team
source $HOME/work/ozg/auslaenderwesen/dienste/scripts/.alias_ozg

export BUILD_STATS_URL="https://service-ozg.dev"

export PROCESSING_ENGINE_ENABLED=true
export PROCESSING_ENGINE_WORKER_ENABLED=false

function an() {
alias k="kubectl -n $1"
alias h="helm -n $1"
alias st="stern -n $1"
}
an ozg-development
# if using Docker Desktop or Rancher Desktop
# export DOCKER_HOST=unix:///var/run/docker.sock
# If using colima
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"

export PATH=${PATH}:${HOME}/work/ozg/devtools/ozg-shelltools


#### BUG FIX
function colima_start() {
    colima start --disk 100 --memory 12 --cpu 4 --vm-type vz --kubernetes --kubernetes-disable=traefik --mount-type virtiofs --mount-inotify
    # colima ssh -- sudo mount -t bpf bpffs /sys/fs/bpf
    # colima ssh -- sudo mount --make-shared /sys/fs/bpf
    # colima ssh -- sudo mkdir -p /run/cilium/cgroupv2
    # colima ssh -- sudo mount -t cgroup2 none /run/cilium/cgroupv2
    # colima ssh -- sudo mount --make-shared /run/cilium/cgroupv2
    # colima ssh -- sudo mount --make-shared /
}
 
function setup_k8s_namespaces() {
    export OZG_REGISTRY=https://harbor.akdb.de/
    export OZG_REGISTRY_USER='o.oeztuerk'
    export OZG_REGISTRY_SECRET='zvm-hwx7xqv6QKH-wbf'
    echo "{\"auths\":{\"${OZG_REGISTRY}\":{\"auth\":\"$(printf "%s:%s" "${OZG_REGISTRY_USER}" "${OZG_REGISTRY_SECRET}" | base64 | tr -d '\n')\"}}}" > /tmp/config.json
    kubectl create ns ozg-development
    #kubectl create ns adebiskita-development
    kubectl -n ozg-development create secret docker-registry regcred --from-file=.dockerconfigjson=/tmp/config.json
    #kubectl -n adebiskita-development create secret docker-registry regcred --from-file=.dockerconfigjson=/tmp/config.json
}
 
function setup_k8s_ingress()
{
    helm upgrade --install ingress-nginx --set controller.ingressClassResource.name=public,controller.allowSnippetAnnotations=true,ingressClass=public,controller.ingressClassResource.default=true ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace    
}
 
function setup_k8s_cert_manager()
{
    helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.11.0 --set installCRDs=true
}
 
function setup_k8s_ca_issuer() {
    kubectl -n ozg-development apply -f $HOME/work/ozg/devtools/cert-manager/ca.yaml
    kubectl -n ozg-development apply -f $HOME/work/ozg/devtools/cert-manager/issuer.yaml  
}
 
function setup_k8s()
{
    setup_k8s_namespaces
    setup_k8s_ingress
    setup_k8s_cert_manager
    setup_k8s_ca_issuer
}

function colima_k8s() {
  setup_k8s
  colima_start
}

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ozan.oeztuerk/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export NODE_OPTIONS=--openssl-legacy-provider
