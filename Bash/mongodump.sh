#mongo badgeville_production --eval "printjson(db.printCollectionStats()())"^C
mongo badgeville_production --eval "printjson(db.printCollectionStats()())"^C


 --query '{ \"created_at\" : { $gte : new Date(#{dateint}000), $lte : new Date(#{date_end}000) } }'"


dateint = Chronic.parse('two days ago midnight').to_i
      time = Chronic.parse('one days ago midnight')


dump_collections_updated = [ 'activity_definitions', 'contents', 'api_keys', 'components', 'contextual_streams', 'groups', 'leaderboards', 'networks', 'reward_definitions', 'site_contents', 'sites', 'social_networks', 'style_sets', 'tracks', 'units', 'users' ]
      dump_collections_created = [ 'activities', 'rewards' ]

