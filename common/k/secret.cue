package k

import (
	corev1 "k8s.io/api/core/v1"
)

#Secret: corev1.#Secret & {
	apiVersion: "v1"
	kind:       "Secret"
}
