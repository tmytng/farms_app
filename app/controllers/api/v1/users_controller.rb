class Api::V1::EmployeesController < ApiController
  after_action :after_login, only: [:create]

end
