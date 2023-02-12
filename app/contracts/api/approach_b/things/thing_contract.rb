class Api::ApproachB::Things::ThingContract
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

  def logic_c
    "#{self.class.name} logic C"
  end

  def call
    @thing[:contract] = case version
                        when (min_version...'1.0.0') then logic_a
                        when ('1.0.0'...'1.2.2')     then logic_b
                        when ('1.2.2'..max_version)  then logic_c
                        else
                          raise NotImplementedError
                        end
    @thing
  end
end
