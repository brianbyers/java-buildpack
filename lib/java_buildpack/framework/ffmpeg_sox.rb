# Cloud Foundry Java Buildpack
# Copyright 2013-2016 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'java_buildpack/component/versioned_dependency_component'
require 'java_buildpack/framework'
require 'java_buildpack/util/qualify_path'

module JavaBuildpack
  module Framework

    class FfmpegSox < JavaBuildpack::Component::VersionedDependencyComponent
      include JavaBuildpack::Util

      # (see JavaBuildpack::Component::BaseComponent#compile)
      def compile
        download_tar
        @droplet.copy_resources

      end

      # (see JavaBuildpack::Component::BaseComponent#release)
      def release
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/:$PATH"
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/lib/:$PATH"
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/usr/bin/:$PATH"
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/usr/lib/:$PATH"
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/usr/share/:$PATH"
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/usr/share/alsa/:$PATH"
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/usr/share/avconv/:$PATH"
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/usr/lib/x86_64-linux-gnu/:$PATH"
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/usr/lib/x86_64-linux-gnu/pulseaudio/:$PATH"
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/usr/lib/x86_64-linux-gnu/sox/:$PATH"
        @droplet.environment_variables.add_environment_variable 'PATH', "#{sox_path}/usr/lib/x86_64-linux-gnu/x264-10bit/:$PATH"


        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/:$LD_LIBRARY_PATH"
        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/lib/:$LD_LIBRARY_PATH"
        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/usr/bin/:$LD_LIBRARY_PATH"
        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/usr/lib/:$LD_LIBRARY_PATH"
        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/usr/share/:$LD_LIBRARY_PATH"
        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/usr/share/alsa/:$LD_LIBRARY_PATH"
        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/usr/share/avconv/:$LD_LIBRARY_PATH"
        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH"
        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/usr/lib/x86_64-linux-gnu/pulseaudio/:$LD_LIBRARY_PATH"
        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/usr/lib/x86_64-linux-gnu/sox/:$LD_LIBRARY_PATH"
        @droplet.environment_variables.add_environment_variable 'LD_LIBRARY_PATH', "#{sox_path}/usr/lib/x86_64-linux-gnu/x264-10bit/:$LD_LIBRARY_PATH"

      end

      protected

      def sox_path
        "#{qualify_path(@droplet.sandbox, @droplet.root)}"
      end

      def supports?
        true
      end
    end

  end
end
