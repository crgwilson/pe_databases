class pe_databases::postgresql_settings::index_settings {

  if $::pe_server_version =~ /^2016.4./ {

    $factsets_indexes = [ 'factsets_pkey',
                          'factsets_certname_idx',
                          'factsets_hash_expr_idx',
                          'idx_factsets_prod', ]

    pe_databases::set_puppetdb_index_fillfactor { $factsets_indexes :
      fillfactor => 50,
    }

    $fact_values_indexes = [ 'fact_values_pkey',
                             'fact_values_value_hash_key',
                             'fact_values_value_float_idx',
                             'fact_values_value_integer_idx', ]

    pe_databases::set_puppetdb_index_fillfactor { $fact_values_indexes :
      fillfactor => 50,
    }

    $edges_indexes = [ 'edges_certname_source_target_type_unique_key' ]

    pe_databases::set_puppetdb_index_fillfactor { $edges_indexes :
      fillfactor => 75,
    }
  }
}
