class Api::ApproachB::Things::ThingSerializer
  include ApproachB::Versioned

  def initialize(version:, thing:)
    @thing = thing
    super
  end

  def logic_a
    "#{self.class.name} logic A"
  end

  def logic_b
    "#{self.class.name} logic B"
  end

  def call
    @thing[:serializer] = case version
                          when (min_version...'1.0.0') then logic_a
                          when ('1.0.0'..max_version)  then logic_b
                          else
                            raise NotImplementedError
                          end
    @thing
  end
end
