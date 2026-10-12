cask "rasql" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "4d3794e96e85ca3aece21f7f7a5a990db4bdc5b3b7c0bc425c3f21a29cb476c1",
         intel: "8a2d39c1379fdc113e1fe7f3ecdf2bd345563e90539c1aed8ec4d8abab23335f"

  url "https://github.com/rmpel/rasql-database-manager/releases/download/v#{version}/RaSQL-#{version}-mac-#{arch}.zip"
  name "RaSQL"
  desc "Database manager for web developers: MySQL, MariaDB and SQLite"
  homepage "https://github.com/rmpel/rasql-database-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "RaSQL.app"

  zap trash: [
    "~/Library/Application Support/RaSQL",
    "~/Library/Preferences/nl.remonpel.rasql.plist",
    "~/Library/Saved Application State/nl.remonpel.rasql.savedState",
  ]

  caveats <<~EOS
    RaSQL is free and open source, and not notarized by Apple.
    The first time you open it, macOS blocks it. To allow it:
      System Settings > Privacy & Security > "RaSQL was blocked" > Open Anyway
    This is needed once per installed version.
  EOS
end
