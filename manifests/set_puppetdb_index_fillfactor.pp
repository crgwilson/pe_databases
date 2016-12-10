define pe_databases::set_puppetdb_index_fillfactor (
  String         $index_name = $title,
  Integer[0,100] $fillfactor,
) {

  $db              = 'pe-puppetdb'
  $index_attribute = 'fillfactor'

  pe_databases::set_index_attribute { "Set ${db}.${index_name} ${index_attribute}=${fillfactor}" :
    db                    => $db,
    index_name            => $index_name,
    index_attribute       => $index_attribute,
    index_attribute_value => "${fillfactor}",
  }
}
