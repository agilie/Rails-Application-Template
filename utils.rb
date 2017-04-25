def parse_groups(groups)
  groups.split(',').map { |group| group.strip.to_sym }
end

def to_bool(value)
  value == 'true'
end

def set_gem(name, params)
  if params == true || params.is_a?(Hash)
    version = params.try(:[], 'version')
    hash = {}
    hash[:group] = parse_groups(params['group']) if params.try(:[], 'group')
    hash[:require] = to_bool(params['require']) unless params.try(:[], 'require').nil?

    gem name.dup, version, hash

    callback = "#{name.gsub('-', '_')}_callback"
    send(callback) if respond_to? callback
  end
end

def set_gems_from_runner(runner)
  $runners[runner]['gems'].each do |name, options|
    set_gem name, options
  end
end