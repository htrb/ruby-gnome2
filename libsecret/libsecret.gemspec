# -*- ruby -*-
#
# Copyright (C) 2019-2025  Ruby-GNOME Project Team
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

require_relative "../glib2/version"

Gem::Specification.new do |s|
  s.name          = "libsecret"
  s.summary       = "Ruby/libsecret is a Ruby binding of libsecret."
  s.description   = "Ruby/libsecret is a Ruby binding of libsecret."
  s.author        = "The Ruby-GNOME Project Team"
  s.email         = "ruby-gnome2-devel-en@lists.sourceforge.net"
  s.homepage      = "https://ruby-gnome.github.io/"
  s.licenses      = ["LGPL-2.1-or-later"]
  s.version       = ruby_glib2_version
  s.extensions    = ["dependency-check/Rakefile"]
  s.require_paths = ["lib"]
  s.files = [
    "COPYING.LIB",
    "README.md",
    "Rakefile",
    "#{s.name}.gemspec",
    "dependency-check/Rakefile",
  ]
  s.files += Dir.glob("lib/**/*.rb")

  s.add_runtime_dependency("gobject-introspection", "= #{s.version}")

  [
    ["alpine_linux", "libsecret-dev"],
    ["alt_linux", "libsecret"],
    ["arch_linux", "libsecret"],
    ["conda", "libsecret"],
    ["debian", "libsecret-1-dev"],
    ["homebrew", "libsecret"],
    ["macports", "libsecret"],
    ["rhel", "pkgconfig(libsecret-1)"],
  ].each do |platform, package|
    s.requirements << "system: libsecret-1: #{platform}: #{package}"
  end

  s.metadata["msys2_mingw_dependencies"] = "libsecret"
end
