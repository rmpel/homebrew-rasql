cask "rasql" do
  arch arm: "arm64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "9b7cddf338e76561e6dbf03b1cbdea52140dc72dcfbd05af137558045614c7b8",
         intel: "1151e5512e51e769c373a1428cfb7731c38e54c28ad9ad899c5a0e5905e73ec0"

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
