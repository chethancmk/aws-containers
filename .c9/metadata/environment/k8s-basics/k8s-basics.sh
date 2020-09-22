{"filter":false,"title":"k8s-basics.sh","tooltip":"/k8s-basics/k8s-basics.sh","undoManager":{"mark":91,"position":91,"stack":[[{"start":{"row":0,"column":0},"end":{"row":1,"column":0},"action":"insert","lines":["    kubectl version",""],"id":1}],[{"start":{"row":1,"column":0},"end":{"row":2,"column":0},"action":"insert","lines":["    kubectl create deployment nginx --image=nginx",""],"id":2}],[{"start":{"row":2,"column":0},"end":{"row":3,"column":0},"action":"insert","lines":["    kubectl describe deployments",""],"id":3}],[{"start":{"row":3,"column":0},"end":{"row":4,"column":0},"action":"insert","lines":["    kubectl describe pods",""],"id":4}],[{"start":{"row":4,"column":0},"end":{"row":5,"column":0},"action":"insert","lines":["    kubectl describe replicasets",""],"id":5}],[{"start":{"row":5,"column":0},"end":{"row":6,"column":0},"action":"insert","lines":["",""],"id":6}],[{"start":{"row":6,"column":0},"end":{"row":7,"column":0},"action":"insert","lines":["A Deployment creates/manages ReplicaSet(s) which, in turn, creates the required Pod(s)",""],"id":7}],[{"start":{"row":6,"column":0},"end":{"row":6,"column":2},"action":"insert","lines":["# "],"id":8}],[{"start":{"row":7,"column":0},"end":{"row":8,"column":0},"action":"insert","lines":["    kubectl scale --replicas=3 deployment/nginx",""],"id":9}],[{"start":{"row":7,"column":29},"end":{"row":7,"column":30},"action":"remove","lines":["3"],"id":10},{"start":{"row":7,"column":29},"end":{"row":7,"column":30},"action":"insert","lines":["1"]}],[{"start":{"row":3,"column":25},"end":{"row":4,"column":0},"action":"insert","lines":["",""],"id":11},{"start":{"row":4,"column":0},"end":{"row":4,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":4,"column":4},"end":{"row":4,"column":32},"action":"insert","lines":["    kubectl get pods -o wide"],"id":12}],[{"start":{"row":4,"column":4},"end":{"row":4,"column":8},"action":"remove","lines":["    "],"id":13},{"start":{"row":4,"column":0},"end":{"row":4,"column":4},"action":"remove","lines":["    "]}],[{"start":{"row":4,"column":0},"end":{"row":4,"column":4},"action":"insert","lines":["    "],"id":14}],[{"start":{"row":9,"column":0},"end":{"row":9,"column":28},"action":"insert","lines":["    kubectl get pods -o wide"],"id":15}],[{"start":{"row":9,"column":28},"end":{"row":10,"column":0},"action":"insert","lines":["",""],"id":16},{"start":{"row":10,"column":0},"end":{"row":10,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":10,"column":4},"end":{"row":11,"column":0},"action":"insert","lines":["    kubectl run my-shell --rm -i --tty --image ubuntu -- bash",""],"id":17}],[{"start":{"row":10,"column":0},"end":{"row":10,"column":8},"action":"remove","lines":["        "],"id":18}],[{"start":{"row":10,"column":0},"end":{"row":10,"column":1},"action":"insert","lines":[" "],"id":19},{"start":{"row":10,"column":1},"end":{"row":10,"column":2},"action":"insert","lines":[" "]},{"start":{"row":10,"column":2},"end":{"row":10,"column":3},"action":"insert","lines":[" "]},{"start":{"row":10,"column":3},"end":{"row":10,"column":4},"action":"insert","lines":[" "]}],[{"start":{"row":10,"column":47},"end":{"row":10,"column":53},"action":"remove","lines":["ubuntu"],"id":20},{"start":{"row":10,"column":47},"end":{"row":10,"column":48},"action":"insert","lines":["b"]},{"start":{"row":10,"column":48},"end":{"row":10,"column":49},"action":"insert","lines":["u"]},{"start":{"row":10,"column":49},"end":{"row":10,"column":50},"action":"insert","lines":["s"]},{"start":{"row":10,"column":50},"end":{"row":10,"column":51},"action":"insert","lines":["y"]},{"start":{"row":10,"column":51},"end":{"row":10,"column":52},"action":"insert","lines":["b"]},{"start":{"row":10,"column":52},"end":{"row":10,"column":53},"action":"insert","lines":["o"]},{"start":{"row":10,"column":53},"end":{"row":10,"column":54},"action":"insert","lines":["x"]}],[{"start":{"row":10,"column":54},"end":{"row":10,"column":55},"action":"remove","lines":[" "],"id":21}],[{"start":{"row":10,"column":54},"end":{"row":10,"column":55},"action":"insert","lines":[" "],"id":23}],[{"start":{"row":10,"column":58},"end":{"row":10,"column":62},"action":"remove","lines":["bash"],"id":24}],[{"start":{"row":10,"column":58},"end":{"row":10,"column":59},"action":"insert","lines":["s"],"id":25},{"start":{"row":10,"column":59},"end":{"row":10,"column":60},"action":"insert","lines":["h"]}],[{"start":{"row":10,"column":4},"end":{"row":10,"column":60},"action":"remove","lines":["kubectl run my-shell --rm -i --tty --image busybox -- sh"],"id":26},{"start":{"row":10,"column":4},"end":{"row":11,"column":0},"action":"insert","lines":["    kubectl run my-shell --rm -i --tty --image ubuntu -- bash",""]}],[{"start":{"row":10,"column":4},"end":{"row":10,"column":8},"action":"remove","lines":["    "],"id":29}],[{"start":{"row":10,"column":61},"end":{"row":11,"column":0},"action":"insert","lines":["",""],"id":30},{"start":{"row":11,"column":0},"end":{"row":11,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":11,"column":4},"end":{"row":13,"column":0},"action":"insert","lines":["    apt update; apt install curl -y","    curl http://<an IP from describe pods>",""],"id":31}],[{"start":{"row":11,"column":4},"end":{"row":11,"column":8},"action":"remove","lines":["    "],"id":32}],[{"start":{"row":11,"column":4},"end":{"row":11,"column":8},"action":"insert","lines":["    "],"id":33}],[{"start":{"row":12,"column":3},"end":{"row":12,"column":4},"action":"insert","lines":[" "],"id":34}],[{"start":{"row":12,"column":4},"end":{"row":12,"column":8},"action":"insert","lines":["    "],"id":35}],[{"start":{"row":12,"column":8},"end":{"row":12,"column":9},"action":"remove","lines":[" "],"id":36}],[{"start":{"row":12,"column":20},"end":{"row":12,"column":46},"action":"remove","lines":["<an IP from describe pods>"],"id":37},{"start":{"row":12,"column":20},"end":{"row":12,"column":32},"action":"insert","lines":[" 10.10.5.156"]}],[{"start":{"row":12,"column":20},"end":{"row":12,"column":21},"action":"remove","lines":[" "],"id":38}],[{"start":{"row":12,"column":31},"end":{"row":13,"column":0},"action":"insert","lines":["",""],"id":39},{"start":{"row":13,"column":0},"end":{"row":13,"column":8},"action":"insert","lines":["        "]},{"start":{"row":13,"column":8},"end":{"row":14,"column":0},"action":"insert","lines":["",""]},{"start":{"row":14,"column":0},"end":{"row":14,"column":8},"action":"insert","lines":["        "]}],[{"start":{"row":14,"column":4},"end":{"row":14,"column":8},"action":"remove","lines":["    "],"id":40},{"start":{"row":14,"column":0},"end":{"row":14,"column":4},"action":"remove","lines":["    "]},{"start":{"row":13,"column":8},"end":{"row":14,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":13,"column":8},"end":{"row":14,"column":0},"action":"insert","lines":["",""],"id":41},{"start":{"row":14,"column":0},"end":{"row":14,"column":8},"action":"insert","lines":["        "]}],[{"start":{"row":14,"column":8},"end":{"row":14,"column":10},"action":"insert","lines":["# "],"id":42}],[{"start":{"row":14,"column":0},"end":{"row":14,"column":8},"action":"remove","lines":["        "],"id":43}],[{"start":{"row":14,"column":2},"end":{"row":14,"column":3},"action":"insert","lines":["S"],"id":44},{"start":{"row":14,"column":3},"end":{"row":14,"column":4},"action":"insert","lines":["e"]},{"start":{"row":14,"column":4},"end":{"row":14,"column":5},"action":"insert","lines":["r"]},{"start":{"row":14,"column":5},"end":{"row":14,"column":6},"action":"insert","lines":["v"]},{"start":{"row":14,"column":6},"end":{"row":14,"column":7},"action":"insert","lines":["i"]},{"start":{"row":14,"column":7},"end":{"row":14,"column":8},"action":"insert","lines":["c"]},{"start":{"row":14,"column":8},"end":{"row":14,"column":9},"action":"insert","lines":["e"]}],[{"start":{"row":14,"column":9},"end":{"row":15,"column":0},"action":"insert","lines":["",""],"id":45}],[{"start":{"row":15,"column":0},"end":{"row":16,"column":0},"action":"insert","lines":["    kubectl expose deployment nginx --port=80 --target-port=80 --name nginx --type=LoadBalancer",""],"id":46}],[{"start":{"row":15,"column":95},"end":{"row":16,"column":0},"action":"insert","lines":["",""],"id":47},{"start":{"row":16,"column":0},"end":{"row":16,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":16,"column":4},"end":{"row":17,"column":0},"action":"insert","lines":["    kubectl get services",""],"id":48}],[{"start":{"row":17,"column":0},"end":{"row":18,"column":0},"action":"insert","lines":["    kubectl logs -lapp=nginx",""],"id":49}],[{"start":{"row":16,"column":4},"end":{"row":16,"column":8},"action":"remove","lines":["    "],"id":50}],[{"start":{"row":19,"column":0},"end":{"row":19,"column":2},"action":"insert","lines":["# "],"id":51}],[{"start":{"row":19,"column":2},"end":{"row":19,"column":3},"action":"insert","lines":["B"],"id":52},{"start":{"row":19,"column":3},"end":{"row":19,"column":4},"action":"insert","lines":["a"]},{"start":{"row":19,"column":4},"end":{"row":19,"column":5},"action":"insert","lines":["c"]},{"start":{"row":19,"column":5},"end":{"row":19,"column":6},"action":"insert","lines":["k"]},{"start":{"row":19,"column":6},"end":{"row":19,"column":7},"action":"insert","lines":["u"]},{"start":{"row":19,"column":7},"end":{"row":19,"column":8},"action":"insert","lines":["p"]}],[{"start":{"row":19,"column":8},"end":{"row":19,"column":9},"action":"insert","lines":[" "],"id":53},{"start":{"row":19,"column":9},"end":{"row":19,"column":10},"action":"insert","lines":["D"]},{"start":{"row":19,"column":10},"end":{"row":19,"column":11},"action":"insert","lines":["e"]},{"start":{"row":19,"column":11},"end":{"row":19,"column":12},"action":"insert","lines":["p"]},{"start":{"row":19,"column":12},"end":{"row":19,"column":13},"action":"insert","lines":["l"]},{"start":{"row":19,"column":13},"end":{"row":19,"column":14},"action":"insert","lines":["o"]},{"start":{"row":19,"column":14},"end":{"row":19,"column":15},"action":"insert","lines":["y"]},{"start":{"row":19,"column":15},"end":{"row":19,"column":16},"action":"insert","lines":["m"]},{"start":{"row":19,"column":16},"end":{"row":19,"column":17},"action":"insert","lines":["e"]},{"start":{"row":19,"column":17},"end":{"row":19,"column":18},"action":"insert","lines":["n"]},{"start":{"row":19,"column":18},"end":{"row":19,"column":19},"action":"insert","lines":["t"]}],[{"start":{"row":19,"column":19},"end":{"row":20,"column":0},"action":"insert","lines":["",""],"id":54}],[{"start":{"row":20,"column":0},"end":{"row":21,"column":0},"action":"insert","lines":["    kubectl get service/nginx deployment/nginx --export=true -o yaml > nginx.yml",""],"id":55}],[{"start":{"row":20,"column":0},"end":{"row":20,"column":4},"action":"remove","lines":["    "],"id":56}],[{"start":{"row":21,"column":0},"end":{"row":22,"column":0},"action":"insert","lines":["    kubectl delete service/nginx deployment/nginx",""],"id":57}],[{"start":{"row":19,"column":19},"end":{"row":19,"column":20},"action":"insert","lines":[" "],"id":58},{"start":{"row":19,"column":20},"end":{"row":19,"column":21},"action":"insert","lines":["a"]},{"start":{"row":19,"column":21},"end":{"row":19,"column":22},"action":"insert","lines":["n"]},{"start":{"row":19,"column":22},"end":{"row":19,"column":23},"action":"insert","lines":["d"]}],[{"start":{"row":19,"column":23},"end":{"row":19,"column":24},"action":"insert","lines":[" "],"id":59},{"start":{"row":19,"column":24},"end":{"row":19,"column":25},"action":"insert","lines":["D"]},{"start":{"row":19,"column":25},"end":{"row":19,"column":26},"action":"insert","lines":["e"]},{"start":{"row":19,"column":26},"end":{"row":19,"column":27},"action":"insert","lines":["l"]},{"start":{"row":19,"column":27},"end":{"row":19,"column":28},"action":"insert","lines":["e"]},{"start":{"row":19,"column":28},"end":{"row":19,"column":29},"action":"insert","lines":["t"]},{"start":{"row":19,"column":29},"end":{"row":19,"column":30},"action":"insert","lines":["e"]}],[{"start":{"row":21,"column":0},"end":{"row":21,"column":4},"action":"remove","lines":["    "],"id":60}],[{"start":{"row":22,"column":0},"end":{"row":22,"column":30},"action":"insert","lines":["    kubectl apply -f nginx.yml"],"id":61}],[{"start":{"row":22,"column":0},"end":{"row":22,"column":4},"action":"remove","lines":["    "],"id":62}],[{"start":{"row":11,"column":4},"end":{"row":11,"column":8},"action":"remove","lines":["    "],"id":63}],[{"start":{"row":12,"column":4},"end":{"row":12,"column":8},"action":"remove","lines":["    "],"id":64}],[{"start":{"row":11,"column":4},"end":{"row":11,"column":8},"action":"insert","lines":["    "],"id":65}],[{"start":{"row":12,"column":4},"end":{"row":12,"column":8},"action":"insert","lines":["    "],"id":66}],[{"start":{"row":20,"column":0},"end":{"row":20,"column":4},"action":"insert","lines":["    "],"id":67},{"start":{"row":21,"column":0},"end":{"row":21,"column":4},"action":"insert","lines":["    "]},{"start":{"row":22,"column":0},"end":{"row":22,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":1,"column":30},"end":{"row":1,"column":35},"action":"remove","lines":["nginx"],"id":68},{"start":{"row":1,"column":30},"end":{"row":1,"column":47},"action":"insert","lines":["tutum/hello-world"]}],[{"start":{"row":1,"column":56},"end":{"row":1,"column":61},"action":"remove","lines":["nginx"],"id":69},{"start":{"row":1,"column":56},"end":{"row":1,"column":57},"action":"insert","lines":["h"]},{"start":{"row":1,"column":57},"end":{"row":1,"column":58},"action":"insert","lines":["e"]},{"start":{"row":1,"column":58},"end":{"row":1,"column":59},"action":"insert","lines":["l"]},{"start":{"row":1,"column":59},"end":{"row":1,"column":60},"action":"insert","lines":["l"]},{"start":{"row":1,"column":60},"end":{"row":1,"column":61},"action":"insert","lines":["o"]}],[{"start":{"row":8,"column":42},"end":{"row":8,"column":47},"action":"remove","lines":["nginx"],"id":70},{"start":{"row":8,"column":42},"end":{"row":8,"column":43},"action":"insert","lines":["h"]},{"start":{"row":8,"column":43},"end":{"row":8,"column":44},"action":"insert","lines":["w"]}],[{"start":{"row":8,"column":43},"end":{"row":8,"column":44},"action":"remove","lines":["w"],"id":71}],[{"start":{"row":8,"column":43},"end":{"row":8,"column":44},"action":"insert","lines":["e"],"id":72},{"start":{"row":8,"column":44},"end":{"row":8,"column":45},"action":"insert","lines":["l"]},{"start":{"row":8,"column":45},"end":{"row":8,"column":46},"action":"insert","lines":["l"]},{"start":{"row":8,"column":46},"end":{"row":8,"column":47},"action":"insert","lines":["o"]},{"start":{"row":8,"column":47},"end":{"row":8,"column":48},"action":"insert","lines":["w"]}],[{"start":{"row":8,"column":48},"end":{"row":8,"column":49},"action":"insert","lines":["o"],"id":73},{"start":{"row":8,"column":49},"end":{"row":8,"column":50},"action":"insert","lines":["r"]},{"start":{"row":8,"column":50},"end":{"row":8,"column":51},"action":"insert","lines":["l"]},{"start":{"row":8,"column":51},"end":{"row":8,"column":52},"action":"insert","lines":["d"]}],[{"start":{"row":1,"column":56},"end":{"row":1,"column":61},"action":"remove","lines":["hello"],"id":74},{"start":{"row":1,"column":56},"end":{"row":1,"column":57},"action":"insert","lines":["h"]},{"start":{"row":1,"column":57},"end":{"row":1,"column":58},"action":"insert","lines":["e"]},{"start":{"row":1,"column":58},"end":{"row":1,"column":59},"action":"insert","lines":["l"]},{"start":{"row":1,"column":59},"end":{"row":1,"column":60},"action":"insert","lines":["l"]},{"start":{"row":1,"column":60},"end":{"row":1,"column":61},"action":"insert","lines":["o"]},{"start":{"row":1,"column":61},"end":{"row":1,"column":62},"action":"insert","lines":["w"]},{"start":{"row":1,"column":62},"end":{"row":1,"column":63},"action":"insert","lines":["o"]},{"start":{"row":1,"column":63},"end":{"row":1,"column":64},"action":"insert","lines":["r"]},{"start":{"row":1,"column":64},"end":{"row":1,"column":65},"action":"insert","lines":["l"]},{"start":{"row":1,"column":65},"end":{"row":1,"column":66},"action":"insert","lines":["d"]}],[{"start":{"row":15,"column":70},"end":{"row":15,"column":75},"action":"remove","lines":["nginx"],"id":75},{"start":{"row":15,"column":70},"end":{"row":15,"column":87},"action":"insert","lines":["tutum/hello-world"]}],[{"start":{"row":15,"column":70},"end":{"row":15,"column":87},"action":"remove","lines":["tutum/hello-world"],"id":76},{"start":{"row":15,"column":70},"end":{"row":15,"column":71},"action":"insert","lines":["h"]},{"start":{"row":15,"column":71},"end":{"row":15,"column":72},"action":"insert","lines":["e"]},{"start":{"row":15,"column":72},"end":{"row":15,"column":73},"action":"insert","lines":["l"]},{"start":{"row":15,"column":73},"end":{"row":15,"column":74},"action":"insert","lines":["l"]},{"start":{"row":15,"column":74},"end":{"row":15,"column":75},"action":"insert","lines":["o"]},{"start":{"row":15,"column":75},"end":{"row":15,"column":76},"action":"insert","lines":["w"]},{"start":{"row":15,"column":76},"end":{"row":15,"column":77},"action":"insert","lines":["o"]},{"start":{"row":15,"column":77},"end":{"row":15,"column":78},"action":"insert","lines":["r"]},{"start":{"row":15,"column":78},"end":{"row":15,"column":79},"action":"insert","lines":["l"]},{"start":{"row":15,"column":79},"end":{"row":15,"column":80},"action":"insert","lines":["d"]}],[{"start":{"row":20,"column":71},"end":{"row":20,"column":76},"action":"remove","lines":["nginx"],"id":77},{"start":{"row":20,"column":71},"end":{"row":20,"column":72},"action":"insert","lines":["h"]},{"start":{"row":20,"column":72},"end":{"row":20,"column":73},"action":"insert","lines":["e"]},{"start":{"row":20,"column":73},"end":{"row":20,"column":74},"action":"insert","lines":["l"]},{"start":{"row":20,"column":74},"end":{"row":20,"column":75},"action":"insert","lines":["l"]},{"start":{"row":20,"column":75},"end":{"row":20,"column":76},"action":"insert","lines":["o"]}],[{"start":{"row":20,"column":76},"end":{"row":20,"column":77},"action":"insert","lines":["w"],"id":78},{"start":{"row":20,"column":77},"end":{"row":20,"column":78},"action":"insert","lines":["o"]},{"start":{"row":20,"column":78},"end":{"row":20,"column":79},"action":"insert","lines":["r"]},{"start":{"row":20,"column":79},"end":{"row":20,"column":80},"action":"insert","lines":["l"]},{"start":{"row":20,"column":80},"end":{"row":20,"column":81},"action":"insert","lines":["d"]}],[{"start":{"row":20,"column":24},"end":{"row":20,"column":29},"action":"remove","lines":["nginx"],"id":79},{"start":{"row":20,"column":24},"end":{"row":20,"column":25},"action":"insert","lines":["h"]},{"start":{"row":20,"column":25},"end":{"row":20,"column":26},"action":"insert","lines":["e"]},{"start":{"row":20,"column":26},"end":{"row":20,"column":27},"action":"insert","lines":["l"]},{"start":{"row":20,"column":27},"end":{"row":20,"column":28},"action":"insert","lines":["l"]},{"start":{"row":20,"column":28},"end":{"row":20,"column":29},"action":"insert","lines":["o"]},{"start":{"row":20,"column":29},"end":{"row":20,"column":30},"action":"insert","lines":["w"]},{"start":{"row":20,"column":30},"end":{"row":20,"column":31},"action":"insert","lines":["o"]},{"start":{"row":20,"column":31},"end":{"row":20,"column":32},"action":"insert","lines":["r"]},{"start":{"row":20,"column":32},"end":{"row":20,"column":33},"action":"insert","lines":["l"]},{"start":{"row":20,"column":33},"end":{"row":20,"column":34},"action":"insert","lines":["d"]}],[{"start":{"row":20,"column":46},"end":{"row":20,"column":51},"action":"remove","lines":["nginx"],"id":80},{"start":{"row":20,"column":46},"end":{"row":20,"column":47},"action":"insert","lines":["h"]},{"start":{"row":20,"column":47},"end":{"row":20,"column":48},"action":"insert","lines":["e"]},{"start":{"row":20,"column":48},"end":{"row":20,"column":49},"action":"insert","lines":["l"]},{"start":{"row":20,"column":49},"end":{"row":20,"column":50},"action":"insert","lines":["l"]},{"start":{"row":20,"column":50},"end":{"row":20,"column":51},"action":"insert","lines":["o"]},{"start":{"row":20,"column":51},"end":{"row":20,"column":52},"action":"insert","lines":["w"]},{"start":{"row":20,"column":52},"end":{"row":20,"column":53},"action":"insert","lines":["o"]},{"start":{"row":20,"column":53},"end":{"row":20,"column":54},"action":"insert","lines":["r"]},{"start":{"row":20,"column":54},"end":{"row":20,"column":55},"action":"insert","lines":["l"]},{"start":{"row":20,"column":55},"end":{"row":20,"column":56},"action":"insert","lines":["d"]}],[{"start":{"row":21,"column":27},"end":{"row":21,"column":32},"action":"remove","lines":["nginx"],"id":81},{"start":{"row":21,"column":27},"end":{"row":21,"column":37},"action":"insert","lines":["helloworld"]}],[{"start":{"row":21,"column":49},"end":{"row":21,"column":54},"action":"remove","lines":["nginx"],"id":82}],[{"start":{"row":21,"column":49},"end":{"row":21,"column":54},"action":"insert","lines":["nginx"],"id":83}],[{"start":{"row":22,"column":21},"end":{"row":22,"column":26},"action":"remove","lines":["nginx"],"id":84},{"start":{"row":22,"column":21},"end":{"row":22,"column":26},"action":"insert","lines":["nginx"]}],[{"start":{"row":1,"column":30},"end":{"row":1,"column":47},"action":"remove","lines":["tutum/hello-world"],"id":85}],[{"start":{"row":1,"column":39},"end":{"row":1,"column":49},"action":"remove","lines":["helloworld"],"id":86},{"start":{"row":1,"column":39},"end":{"row":1,"column":56},"action":"insert","lines":["tutum/hello-world"]}],[{"start":{"row":1,"column":29},"end":{"row":1,"column":30},"action":"insert","lines":[" "],"id":87},{"start":{"row":1,"column":30},"end":{"row":1,"column":31},"action":"insert","lines":["h"]},{"start":{"row":1,"column":31},"end":{"row":1,"column":32},"action":"insert","lines":["e"]},{"start":{"row":1,"column":32},"end":{"row":1,"column":33},"action":"insert","lines":["l"]},{"start":{"row":1,"column":33},"end":{"row":1,"column":34},"action":"insert","lines":["l"]},{"start":{"row":1,"column":34},"end":{"row":1,"column":35},"action":"insert","lines":["o"]},{"start":{"row":1,"column":35},"end":{"row":1,"column":36},"action":"insert","lines":["w"]},{"start":{"row":1,"column":36},"end":{"row":1,"column":37},"action":"insert","lines":["o"]}],[{"start":{"row":1,"column":37},"end":{"row":1,"column":38},"action":"insert","lines":["r"],"id":88},{"start":{"row":1,"column":38},"end":{"row":1,"column":39},"action":"insert","lines":["l"]},{"start":{"row":1,"column":39},"end":{"row":1,"column":40},"action":"insert","lines":["d"]}],[{"start":{"row":8,"column":29},"end":{"row":8,"column":30},"action":"remove","lines":["1"],"id":89},{"start":{"row":8,"column":29},"end":{"row":8,"column":30},"action":"insert","lines":["3"]}],[{"start":{"row":15,"column":30},"end":{"row":15,"column":35},"action":"remove","lines":["nginx"],"id":90},{"start":{"row":15,"column":30},"end":{"row":15,"column":31},"action":"insert","lines":["h"]},{"start":{"row":15,"column":31},"end":{"row":15,"column":32},"action":"insert","lines":["e"]},{"start":{"row":15,"column":32},"end":{"row":15,"column":33},"action":"insert","lines":["l"]},{"start":{"row":15,"column":33},"end":{"row":15,"column":34},"action":"insert","lines":["l"]},{"start":{"row":15,"column":34},"end":{"row":15,"column":35},"action":"insert","lines":["o"]},{"start":{"row":15,"column":35},"end":{"row":15,"column":36},"action":"insert","lines":["w"]},{"start":{"row":15,"column":36},"end":{"row":15,"column":37},"action":"insert","lines":["o"]},{"start":{"row":15,"column":37},"end":{"row":15,"column":38},"action":"insert","lines":["r"]},{"start":{"row":15,"column":38},"end":{"row":15,"column":39},"action":"insert","lines":["l"]},{"start":{"row":15,"column":39},"end":{"row":15,"column":40},"action":"insert","lines":["d"]}],[{"start":{"row":17,"column":23},"end":{"row":17,"column":28},"action":"remove","lines":["nginx"],"id":91},{"start":{"row":17,"column":23},"end":{"row":17,"column":33},"action":"insert","lines":["helloworld"]}],[{"start":{"row":21,"column":49},"end":{"row":21,"column":54},"action":"remove","lines":["nginx"],"id":92},{"start":{"row":21,"column":49},"end":{"row":21,"column":50},"action":"insert","lines":["h"]},{"start":{"row":21,"column":50},"end":{"row":21,"column":51},"action":"insert","lines":["e"]},{"start":{"row":21,"column":51},"end":{"row":21,"column":52},"action":"insert","lines":["l"]},{"start":{"row":21,"column":52},"end":{"row":21,"column":53},"action":"insert","lines":["l"]},{"start":{"row":21,"column":53},"end":{"row":21,"column":54},"action":"insert","lines":["o"]},{"start":{"row":21,"column":54},"end":{"row":21,"column":55},"action":"insert","lines":["w"]},{"start":{"row":21,"column":55},"end":{"row":21,"column":56},"action":"insert","lines":["o"]},{"start":{"row":21,"column":56},"end":{"row":21,"column":57},"action":"insert","lines":["r"]},{"start":{"row":21,"column":57},"end":{"row":21,"column":58},"action":"insert","lines":["l"]},{"start":{"row":21,"column":58},"end":{"row":21,"column":59},"action":"insert","lines":["d"]}],[{"start":{"row":22,"column":21},"end":{"row":22,"column":26},"action":"remove","lines":["nginx"],"id":93},{"start":{"row":22,"column":21},"end":{"row":22,"column":31},"action":"insert","lines":["helloworld"]}],[{"start":{"row":1,"column":50},"end":{"row":1,"column":67},"action":"remove","lines":["tutum/hello-world"],"id":94},{"start":{"row":1,"column":50},"end":{"row":1,"column":51},"action":"insert","lines":["n"]},{"start":{"row":1,"column":51},"end":{"row":1,"column":52},"action":"insert","lines":["g"]},{"start":{"row":1,"column":52},"end":{"row":1,"column":53},"action":"insert","lines":["i"]},{"start":{"row":1,"column":53},"end":{"row":1,"column":54},"action":"insert","lines":["n"]},{"start":{"row":1,"column":54},"end":{"row":1,"column":55},"action":"insert","lines":["x"]}],[{"start":{"row":1,"column":30},"end":{"row":1,"column":40},"action":"remove","lines":["helloworld"],"id":95},{"start":{"row":1,"column":30},"end":{"row":1,"column":35},"action":"insert","lines":["nginx"]},{"start":{"row":8,"column":42},"end":{"row":8,"column":52},"action":"remove","lines":["helloworld"]},{"start":{"row":8,"column":42},"end":{"row":8,"column":47},"action":"insert","lines":["nginx"]},{"start":{"row":15,"column":30},"end":{"row":15,"column":40},"action":"remove","lines":["helloworld"]},{"start":{"row":15,"column":30},"end":{"row":15,"column":35},"action":"insert","lines":["nginx"]},{"start":{"row":15,"column":70},"end":{"row":15,"column":80},"action":"remove","lines":["helloworld"]},{"start":{"row":15,"column":70},"end":{"row":15,"column":75},"action":"insert","lines":["nginx"]},{"start":{"row":17,"column":23},"end":{"row":17,"column":33},"action":"remove","lines":["helloworld"]},{"start":{"row":17,"column":23},"end":{"row":17,"column":28},"action":"insert","lines":["nginx"]},{"start":{"row":20,"column":24},"end":{"row":20,"column":34},"action":"remove","lines":["helloworld"]},{"start":{"row":20,"column":24},"end":{"row":20,"column":29},"action":"insert","lines":["nginx"]},{"start":{"row":20,"column":41},"end":{"row":20,"column":51},"action":"remove","lines":["helloworld"]},{"start":{"row":20,"column":41},"end":{"row":20,"column":46},"action":"insert","lines":["nginx"]},{"start":{"row":20,"column":71},"end":{"row":20,"column":81},"action":"remove","lines":["helloworld"]},{"start":{"row":20,"column":71},"end":{"row":20,"column":76},"action":"insert","lines":["nginx"]},{"start":{"row":21,"column":27},"end":{"row":21,"column":37},"action":"remove","lines":["helloworld"]},{"start":{"row":21,"column":27},"end":{"row":21,"column":32},"action":"insert","lines":["nginx"]},{"start":{"row":21,"column":44},"end":{"row":21,"column":54},"action":"remove","lines":["helloworld"]},{"start":{"row":21,"column":44},"end":{"row":21,"column":49},"action":"insert","lines":["nginx"]},{"start":{"row":22,"column":21},"end":{"row":22,"column":31},"action":"remove","lines":["helloworld"]},{"start":{"row":22,"column":21},"end":{"row":22,"column":26},"action":"insert","lines":["nginx"]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":20,"column":55},"end":{"row":20,"column":69},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"hash":"f09e633b8cbc7d85411e490a8f32e76833f04afe","timestamp":1600677310653}