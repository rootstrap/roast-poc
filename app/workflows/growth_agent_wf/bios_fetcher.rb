# frozen_string_literal: true

class BiosFetcher < Roast::Workflow::BaseStep
  def call
    filtered_profiles = workflow.output["profile_filter_parser"]
    
    bios_details = filtered_profiles.filter_map do |profile|
      get_mock_biography(profile[:name])
    end
      
    { bios_details: bios_details }
  end

  private

  def get_mock_biography(name)
    mock_biographies = {
      "Ana Gómez" => {
        employee: {
          full_name: "Ana Gómez",
          location: "Argentina"
        },
        additional_context: {
          role: {
            name: "Frontend Developer"
          },
          avatar_url: "https://via.placeholder.com/150?text=AG",
          seniority: "Mid"
        },
        biography: "Ana is a skilled Frontend Developer with 3+ years of experience specializing in React Native and mobile application development. She has successfully delivered multiple healthcare and finance applications, demonstrating strong technical skills and collaborative teamwork. Her expertise in TypeScript and modern frontend frameworks makes her an excellent choice for mobile-first projects.",
        skills: ["React Native", "TypeScript", "Redux", "JavaScript", "CSS3", "HTML5"],
        experience: "3 years",
        projects: [
          {
            name: "HealthTracker Mobile App",
            description: "React Native healthcare application with real-time monitoring",
            technologies: ["React Native", "TypeScript", "Firebase"]
          },
          {
            name: "FinanceManager Dashboard", 
            description: "Financial management platform with interactive charts",
            technologies: ["React", "D3.js", "Redux"]
          }
        ],
        industries: ["Healthcare", "Finance"],
        languages: ["Spanish", "English"]
      },
      "Luis Pérez" => {
        employee: {
          full_name: "Luis Pérez",
          location: "Colombia"
        },
        additional_context: {
          role: {
            name: "Backend Developer"
          },
          avatar_url: "https://via.placeholder.com/150?text=LP",
          seniority: "Senior"
        },
        biography: "Luis is a Senior Backend Developer with 5+ years of experience building scalable Node.js applications. He has led multiple e-commerce projects and has strong expertise in database design, API development, and system architecture. His leadership skills and mentoring experience make him valuable for team coordination and technical decision-making.",
        skills: ["Node.js", "PostgreSQL", "Express.js", "MongoDB", "Docker", "AWS"],
        experience: "5 years",
        projects: [
          {
            name: "E-commerce Platform API",
            description: "Scalable REST API handling 100k+ daily transactions",
            technologies: ["Node.js", "PostgreSQL", "Redis", "Docker"]
          },
          {
            name: "Microservices Architecture",
            description: "Designed and implemented microservices for order management",
            technologies: ["Node.js", "MongoDB", "RabbitMQ", "Kubernetes"]
          }
        ],
        industries: ["E-commerce", "Retail"],
        languages: ["Spanish", "English"]
      },
      "Roberto Martínez" => {
        employee: {
          full_name: "Roberto Martínez",
          location: "Mexico"
        },
        additional_context: {
          role: {
            name: "DevOps Engineer"
          },
          avatar_url: "https://via.placeholder.com/150?text=RM",
          seniority: "Senior"
        },
        biography: "Roberto is a Senior DevOps Engineer with extensive experience in AWS cloud infrastructure and container orchestration. He specializes in CI/CD pipelines, infrastructure as code, and monitoring solutions. His expertise in Kubernetes and Docker has helped teams achieve 99.9% uptime and faster deployment cycles.",
        skills: ["AWS", "Docker", "Kubernetes", "Terraform", "Jenkins", "Prometheus"],
        experience: "4 years",
        projects: [
          {
            name: "Cloud Migration Project",
            description: "Migrated legacy infrastructure to AWS with zero downtime",
            technologies: ["AWS", "Terraform", "Docker", "Kubernetes"]
          },
          {
            name: "CI/CD Pipeline Optimization",
            description: "Reduced deployment time from 2 hours to 15 minutes",
            technologies: ["Jenkins", "Docker", "AWS CodePipeline"]
          }
        ],
        industries: ["Cloud Services", "E-commerce"],
        languages: ["Spanish", "English"]
      }
    }
    
    mock_biographies[name]
  end
end 