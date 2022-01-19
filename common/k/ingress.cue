package k

import (
	appsv1 "k8s.io/api/networking/v1"
)

#Ingress: appsv1.#Ingress & {
	apiVersion: "networking.k8s.io/v1"
	kind:       "Ingress"
}
