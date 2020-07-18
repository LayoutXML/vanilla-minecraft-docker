#!/bin/bash

VERSIONS_JSON_URL="https://launchermeta.mojang.com/mc/game/version_manifest.json"

#Setup environment and validate inputs
mkdir -p "$FOLDER_NAME"
cd "$FOLDER_NAME"

if ! [ -f "eula.txt" ]; then
  echo "eula=$EULA" > "eula.txt"
fi

if [ -z $MINECRAFT_VERSION ]; then
  MINECRAFT_VERSION=$(wget -qO- $VERSIONS_JSON_URL | jq -r ".latest.release")
fi

#Download jar file
if [[ ! -f "minecraft_version.$MINECRAFT_VERSION.jar" ]]; then
  SPECIFIC_VERSION_JSON_URL=$(wget -qO- $VERSIONS_JSON_URL | jq --arg MINECRAFT_VERSION "$MINECRAFT_VERSION" -r '[.versions[]|select(.id == $MINECRAFT_VERSION)][0].url')
  JAR_URL=$(wget -qO- $SPECIFIC_VERSION_JSON_URL | jq -r '.downloads.server.url')
  wget $JAR_URL -O "minecraft_version.$MINECRAFT_VERSION.jar"
fi

echo "Starting server with following options:"
echo -e "JDK_VERSION:\t$JDK_VERSION"
echo -e "FOLDER_NAME:\t$FOLDER_NAME"
echo -e "MINECRAFT_VERSION:\t$MINECRAFT_VERSION"
echo -e "RAM:\t$RAM"
echo -e "JAVA_ARGS:\t--nogui$JAVA_ARGS"

java -Xmx$RAM -Xms$RAM $JAVA_OPTS -jar minecraft_version.$MINECRAFT_VERSION.jar --nogui
