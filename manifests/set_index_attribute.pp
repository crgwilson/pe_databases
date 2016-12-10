define pe_databases::set_index_attribute (
  String $db,
  String $index_name,
  String $index_attribute,
  String $index_attribute_value,
) {

  postgresql_psql { "Set ${index_attribute}=${index_attribute_value} for ${index_name}" :
      command    => "ALTER INDEX ${index_name} SET ( ${index_attribute} = ${index_attribute_value} )",
      unless     => "SELECT reloptions FROM pg_class WHERE relname = '${index_name}' AND CAST(reloptions as text) LIKE '%${index_attribute}=${index_attribute_value}%'",
      db         => $db,
      psql_user  => 'pe-postgres',
      psql_group => 'pe-postgres',
      psql_path  => '/opt/puppetlabs/server/bin/psql',
    }
}
