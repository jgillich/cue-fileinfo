package ghost

import (
	"github.com/skynomads/cloudplane/operator/api/v1alpha1"
	"github.com/skynomads/cloudplane/operator/pkg/template/common"
)

v1alpha1.#Template

apiVersion: "platform.cloudplane.org/v1alpha1"
kind:       "Template"
metadata: {
	name: "ghost"
}
name:        "Ghost"
description: "A publishing platform for independent writers"
license:     "MIT"
website:     "https://ghost.org/"
schema: {
	"$schema": "https://json-schema.org/draft/2020-12/schema"
	type:      "object"
	required: [
		"email",
		"password",
	]
	properties: {
		email: {
			description: "User email"
			type:        "string"
			format:      "email"
			form:        true
		}
		password: {
			description: "User password"
			type:        "string"
			minLength:   10
			form:        false
			generate:    "password"
		}
	}
	additionalProperties: false
}

#values: {
	email:    string | *""
	password: string | *""
}

if common.app.spec.values != _|_ {
	#values: common.app.spec.values
}
