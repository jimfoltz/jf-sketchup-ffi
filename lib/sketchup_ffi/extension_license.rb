module SketchupFFI

  SUExtensionLicenseState = enum(
    :licensed,
    :expired,
    :trial,
    :trial_expired,
    :not_licensed
  )

  class SUExtensionLicense < FFI::Struct
    layout(
      :is_licensed, :bool,
      :state, SUExtensionLicenseState,
      :days_remaining, :size_t,
      :error_description, :string
    )
  end

  attach_function(:SUGetExtensionLicense, [:string, SUExtensionLicense], SUResult)

end
