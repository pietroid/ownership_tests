IFS=',' read -ra COMMITS <<< "asdaskdkasdkk"
for commit in "${COMMITS[@]}"; do
    echo "Checking out commit: $commit"
done