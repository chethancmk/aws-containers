# Limit Range

1. Create Namespace limit-range
    kubectl create namespace limit-range

2. Create Limit range for the namespace 
    k apply -f limit-range.yaml

3. Create a Pod breaching the limit threshold to see error
    k apply -f 1-pod-with-limit.yaml

4. Create a Pod without limit to see the pod inherit the upper limit
    k apply -f 2-pod-without-limit.yaml

4. Clean up
    k delete namespace limit-range    