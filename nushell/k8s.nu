def environments [] { ["prod", "stage"] }

alias k = kubectl

def invalid-env [k8env: string@environments]  {
  if (environments | where $it == $k8env | is-empty) {
    print "Invalid environment. Use 'prod' or 'stage'."
    return true
  }
  return false
}


def "nu-complete k get-clusters" [] {
  ^kubectl config get-contexts -o name | lines
}


def ksc [context: string@"nu-complete k get-clusters"] {
  kubectl config use-context $context
}


def ka [file: string] {
  kubectl apply -f $file
}

def "nu-complete k get-namespaces" [] {
  ^kubectl get namespaces -o=custom-columns=NAME:.metadata.name --no-headers | lines
}

def ksn [namespace: string@"nu-complete k get-namespaces"] {
  kubectl config set-context --current --namespace $namespace
}


