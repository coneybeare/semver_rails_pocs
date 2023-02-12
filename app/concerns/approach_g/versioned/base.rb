module ApproachG::Versioned::Base
  extend ActiveSupport::Concern

  class_methods do
    MIN_SUPPORTED_VERSION = '0.0.1'
    MAX_SUPPORTED_VERSION = '1.2.3'

    def min_version
      Semantic::Version.new(MIN_SUPPORTED_VERSION)
    end

    def max_version
      Semantic::Version.new(MAX_SUPPORTED_VERSION)
    end
  end

  def call
    raise NotImplementedError, 'Api Version not supported for this version'
  end

  def version_at_least?(low_bound)
    low_bound <= version
  end

  def version_at_most?(high_bound)
    version <= high_bound
  end

  def version_between?(low_bound, high_bound)
    version_at_least?(low_bound) && version_at_most?(high_bound)
  end

  class_methods do
    def supports_versions_between(low_bound_version, high_bound_version)
      self_class = self
      call_proxy = Module.new
      call_proxy.define_method(:call) do |*args, **kwargs, &block|
        puts "#{self_class.name} | low_bound_version: #{low_bound_version} | high_bound_version: #{high_bound_version}"
        unless version_between?(low_bound_version, high_bound_version)
          puts " - unsupported version: #{version}"
          next_ancestor = self_class.ancestors[2] # 0 is this prepended module, 1 is the wrapped class, 2 is next module the chain
          if next_ancestor.method_defined?(:call)
            puts " - calling: #{next_ancestor}#call"
            return next_ancestor.instance_method(:call).bind(self).call
          else
            puts " - calling: #{next_ancestor} does not_respond to call"
          end
        end

        puts 'calling: super#call'
        super(*args, **kwargs, &block)
      end
      prepend call_proxy
    end
  end
end
