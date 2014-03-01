template config/nodes_properties;

variable SITES ?= list('example');

#variable NEW_NODES_PROPS ?= {
variable NODES_PROPS = {
  nodes_add = nlist();
  nodes_props = nlist();
  allsites = SITES;
  ok = first(allsites,k,v);
  while (ok) {
    nodes_add = merge(create("config/"+v+"_nodes_properties"),nodes_props);
    nodes_props = merge(nodes_add[v],nodes_props);
    ok = next(allsites,k,v);
};
  nodes_props;
};

