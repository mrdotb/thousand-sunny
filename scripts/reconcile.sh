#!/bin/bash
#
# Force update Flux to pull in changes from the Git repository

flux reconcile -n flux-system kustomization cluster --with-source
