# -*- ruby -*-
#
# Copyright (C) 2018-2025  Ruby-GNOME Project Team
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
  s.name          = "gdk3"
  s.summary       = "Ruby/GDK3 is a Ruby binding of GDK-3.x."
  s.description   = "Ruby/GDK3 is a Ruby binding of GDK-3.x."
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
  s.files += Dir.glob("test/**/*")

  s.add_runtime_dependency("pango", "= #{s.version}")
  s.add_runtime_dependency("gdk_pixbuf2", "= #{s.version}")
  s.add_runtime_dependency("cairo-gobject", "= #{s.version}")

  [
    ["alpine_linux", "gtk+3.0-dev"],
    ["arch_linux", "gtk3"],
    ["conda", "gtk3"],
    ["conda", "liblzma-devel"],
    ["conda", "xorg-compositeproto"],
    ["conda", "xorg-damageproto"],
    ["conda", "xorg-fixesproto"],
    ["conda", "xorg-inputproto"],
    ["conda", "xorg-randrproto"],
    ["conda", "xorg-recordproto"],
    ["conda", "xorg-xineramaproto"],
    ["debian", "libgtk-3-dev"],
    ["homebrew", "gtk+3"],
    ["macports", "gtk3"],
    ["rhel", "pkgconfig(gdk-3.0)"],
  ].each do |platform, package|
    s.requirements << "system: gdk-3.0: #{platform}: #{package}"
  end

  s.metadata["msys2_mingw_dependencies"] = "gtk3"
end
