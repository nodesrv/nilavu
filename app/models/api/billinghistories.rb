##
## Copyright [2013-2015] [Megam Systems]
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
module Api
  class Billedhistories < APIDispatch
    attr_reader :balance

    BILLEDHISTORIES = 'BILLEDHISTORIES'.freeze

    def initialize()
      @balance = {}
    end

    def show(api_params, &block)
      raw = api_request(BALANCES, SHOW,api_params)
      @balance = raw[:body].lookup(api_params["email"])
      yield self  if block_given?
      return self
    end

    def list(api_params, &block)
      raw = api_request(BILLEDHISTORIES, LIST, api_params)
      @bhistories = raw[:body].sort_by{|e| e.created_at}.reverse[0..9] unless raw == nil
      yield self  if block_given?
      return self
    end
  end
end