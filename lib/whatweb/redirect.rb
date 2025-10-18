# Copyright 2009 to 2025 Andrew Horton and Brendan Coles
#
# This file is part of WhatWeb.
#
# WhatWeb is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# at your option) any later version.
#
# WhatWeb is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with WhatWeb.  If not, see <http://www.gnu.org/licenses/>.

module WhatWeb
  class Redirect
    # Checks for redirect and adds redirection target URL to Scanner
    def initialize(target, scanner, max_redirects)
      redirect_url = target.get_redirection_target

      if redirect_url.nil?
        debug("No valid redirect target found for #{target.target}")
        return
      end

      if target.redirect_counter >= max_redirects
        error("ERROR Too many redirects: #{target} => #{redirect_url}")
        return
      end

      # pp target.redirect_counter, redirect_url
      debug("redirect #{target.redirect_counter + 1} from #{target.target} to #{redirect_url}")
      scanner.add_target(redirect_url, target.redirect_counter + 1)
    end
  end
end
