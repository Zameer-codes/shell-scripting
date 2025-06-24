#printing into terminal
echo "Executing InsertContentIntoFile.sh script file"

if [ ! -f "./results/insert.md" ]; then
	mkdir "./results"
	touch "./results/insert.md"
fi

cat > ./results/insert.md << 'EOL'
" write content here "
EOL

echo "Content written to ./results/insert.md"