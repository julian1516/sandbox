#!/bin/bash
echo "Vault version: $(vault version)"
echo "OpenShift version: $(oc version)"
echo "curl version: $(curl --version | head -n 1)"
echo "wget version: $(wget --version | head -n 1)"
echo "unzip version: $(unzip -v | head -n 1)"
