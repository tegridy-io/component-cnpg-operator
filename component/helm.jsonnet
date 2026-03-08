// helm template for immich
local com = import 'lib/commodore.libjsonnet';
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';

// The hiera parameters for the component
local inv = kap.inventory();
local params = inv.parameters.cnpg_operator;
local image = std.get(params.images, 'cloudnative-pg', {});

local values = {
  image: {
    repository: '%(registry)s/%(repository)s' % image,
    tag: image.tag,
  },
};

// Define outputs below
{
  'cnpg-values': values,
  'cnpg-overrides': params.helmValues,
}
