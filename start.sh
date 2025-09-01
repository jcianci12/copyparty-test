#!/bin/bash

# Copyparty Docker Stack Startup Script

echo "🚀 Starting Copyparty Docker Stack..."

# Create necessary directories
echo "📁 Creating directories..."
mkdir -p data logs

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker and try again."
    exit 1
fi

# Start the stack (no build needed with official image)
echo "🔨 Starting containers..."
docker-compose up -d

# Wait a moment for the service to start
echo "⏳ Waiting for service to start..."
sleep 5

# Check if the service is running
if docker-compose ps | grep -q "Up"; then
    echo "✅ Copyparty is running!"
    echo "🌐 Access the web interface at: http://localhost:3923"
    echo "📱 QR code should be displayed in the logs"
    echo ""
    echo "📋 Useful commands:"
    echo "  View logs: docker-compose logs -f copyparty"
    echo "  Stop: docker-compose down"
    echo "  Restart: docker-compose restart"
    echo ""
    echo "📂 Your files:"
    echo "  - Shared files: ./data/"
    echo "  - Logs: ./logs/"
    echo ""
    echo "🎉 Success! Copyparty is now accessible at http://localhost:3923"
else
    echo "❌ Failed to start copyparty. Check logs with: docker-compose logs"
    exit 1
fi
