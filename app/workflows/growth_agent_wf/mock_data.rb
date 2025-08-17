# frozen_string_literal: true

module MockData
  class << self
    def notion_profiles
      [
        # === TECHNICAL LEADS ===
        {
          name: "Emiliano Vega",
          role: "Technical Lead",
          tags: ["Ruby on Rails", "System Architecture", "AWS", "PostgreSQL", "Technical Leadership", "Financial Systems", "Banking Architecture"],
          linkBios: "https://bios.co/emiliano-vega"
        },
        {
          name: "Roberto Vega",
          role: "Technical Lead",
          tags: ["Ruby on Rails", "React", "Docker", "AWS", "Code Review", "E-learning Platforms", "Educational Technology"],
          linkBios: "https://bios.co/roberto-vega"
        },

        # === PRODUCT & PROJECT MANAGERS ===
        {
          name: "Carolina Jiménez",
          role: "Product Manager",
          tags: ["Product Vision", "User Research", "Data Analysis", "Go-to-Market Strategy", "Team Leadership", "Healthcare Products", "Medical Software"],
          linkBios: "https://bios.co/carolina-jimenez"
        },
        {
          name: "Alejandro Ruiz",
          role: "Product Manager",
          tags: ["Product Strategy", "User Research", "Agile", "Roadmapping", "Customer Development", "E-commerce Products", "Marketplace Strategy"],
          linkBios: "https://bios.co/alejandro-ruiz"
        },
        {
          name: "Valeria Castro",
          role: "Project Manager",
          tags: ["Project Management", "Ruby on Rails", "Team Leadership", "Technical Strategy", "People Management"],
          linkBios: "https://bios.co/valeria-castro"
        },
        {
          name: "Elena Castro",
          role: "Project Manager",
          tags: ["Project Management", "Ruby on Rails", "React", "Agile", "Process Improvement"],
          linkBios: "https://bios.co/elena-castro"
        },
        {
          name: "Juliana Torres",
          role: "Project Manager",
          tags: ["Project Delivery", "Agile Management", "Client Relations", "Team Coordination", "Process Improvement"],
          linkBios: "https://bios.co/juliana-torres"
        },
        {
          name: "Verónica Morales",
          role: "Project Manager",
          tags: ["Project Delivery", "Scrum", "Stakeholder Management", "Risk Management", "Quality Assurance"],
          linkBios: "https://bios.co/veronica-morales"
        },
        {
          name: "Federico Rojas",
          role: "Project Manager",
          tags: ["Project Planning", "Agile", "Budget Control", "Timeline Management", "Communication"],
          linkBios: "https://bios.co/federico-rojas"
        },
        {
          name: "Mariana Paredes",
          role: "Project Manager",
          tags: ["Project Management", "Agile Coaching", "Team Facilitation", "Sprint Planning", "Retrospectives"],
          linkBios: "https://bios.co/mariana-paredes"
        },

        # === BACKEND DEVELOPERS ===
        {
          name: "Santiago López",
          role: "Backend Developer",
          tags: ["Ruby on Rails", "PostgreSQL", "AWS", "API Design", "Hotwire", "Facturación Electrónica", "SII Integration"],
          linkBios: "https://bios.co/santiago-lopez"
        },
        {
          name: "Camila Rodríguez",
          role: "Backend Developer",
          tags: ["Ruby on Rails", "PostgreSQL", "Docker", "AWS", "API Design", "Healthcare APIs", "HL7 Integration"],
          linkBios: "https://bios.co/camila-rodriguez"
        },
        {
          name: "Lucas Fernández",
          role: "Backend Developer",
          tags: ["Ruby on Rails", "PostgreSQL", "Performance", "Hotwire", "AWS", "Digital Signatures", "PKI Integration"],
          linkBios: "https://bios.co/lucas-fernandez"
        },
        {
          name: "Martín Suárez",
          role: "Backend Developer",
          tags: ["Ruby on Rails", "PostgreSQL", "AWS", "Docker", "Testing", "E-learning Platforms", "LMS Integration"],
          linkBios: "https://bios.co/martin-suarez"
        },
        {
          name: "Catalina Morales",
          role: "Backend Developer",
          tags: ["Ruby on Rails", "Hotwire", "PostgreSQL", "AWS", "Performance Optimization", "Healthcare APIs", "HL7 Integration"],
          linkBios: "https://bios.co/catalina-morales"
        },
        {
          name: "Lucia Paredes",
          role: "Backend Developer",
          tags: ["Ruby on Rails", "System Design", "AWS", "PostgreSQL", "Performance", "IoT Integration", "Real-time Data"],
          linkBios: "https://bios.co/lucia-paredes"
        },
        {
          name: "Roberto Méndez",
          role: "Backend Developer",
          tags: ["Ruby on Rails", "PostgreSQL", "AWS", "API Design", "Microservices", "Banking APIs", "Financial Compliance"],
          linkBios: "https://bios.co/roberto-mendez"
        },
        {
          name: "Mariana López",
          role: "Backend Developer",
          tags: ["Ruby on Rails", "PostgreSQL", "AWS", "Docker", "API Design", "Machine Learning", "Data Analytics"],
          linkBios: "https://bios.co/mariana-lopez"
        },

        # === FULL STACK DEVELOPERS ===
        {
          name: "Valentina González",
          role: "Full Stack Developer",
          tags: ["Ruby on Rails", "React", "PostgreSQL", "AWS", "TypeScript", "Healthcare Dashboards", "Medical Records"],
          linkBios: "https://bios.co/valentina-gonzalez"
        },
        {
          name: "Sofía Castro",
          role: "Full Stack Developer",
          tags: ["Ruby on Rails", "React", "PostgreSQL", "AWS", "Testing", "E-commerce Platforms", "Payment Gateways"],
          linkBios: "https://bios.co/sofia-castro"
        },
        {
          name: "Patricia Torres",
          role: "Full Stack Developer",
          tags: ["Ruby on Rails", "React", "Node.js", "AWS", "TypeScript", "Microservices", "API Design"],
          linkBios: "https://bios.co/patricia-torres"
        },
        {
          name: "Sofia Mendoza",
          role: "Full Stack Developer",
          tags: ["Ruby on Rails", "System Architecture", "AWS", "PostgreSQL", "Performance Optimization", "Video Streaming", "CDN Integration"],
          linkBios: "https://bios.co/sofia-mendoza"
        },
        {
          name: "Sebastián Mendoza",
          role: "Full Stack Developer",
          tags: ["Ruby on Rails", "React", "AWS", "TypeScript", "Performance", "Mobile-First Design", "Progressive Web Apps"],
          linkBios: "https://bios.co/sebastian-mendoza"
        },
        {
          name: "Daniel Vargas",
          role: "Full Stack Developer",
          tags: ["Ruby on Rails", "React", "JavaScript", "Agile Development", "Code Quality", "Video Streaming", "Content Management"],
          linkBios: "https://bios.co/daniel-vargas"
        },
        {
          name: "Carlos Ruiz",
          role: "Full Stack Developer",
          tags: ["Ruby on Rails", "React", "PostgreSQL", "AWS", "TypeScript", "IoT Integration", "Real-time Data"],
          linkBios: "https://bios.co/carlos-ruiz"
        },
        {
          name: "Gabriela Torres",
          role: "Full Stack Developer",
          tags: ["Ruby on Rails", "React", "PostgreSQL", "AWS", "TypeScript", "Blockchain", "Smart Contracts"],
          linkBios: "https://bios.co/gabriela-torres"
        },

        # === FRONTEND DEVELOPERS ===
        {
          name: "Mateo Silva",
          role: "Frontend Developer",
          tags: ["React", "TypeScript", "JavaScript", "Figma", "UI/UX", "E-learning Interfaces", "Course Management"],
          linkBios: "https://bios.co/mateo-silva"
        },
        {
          name: "Isabella Morales",
          role: "Frontend Developer",
          tags: ["React", "TypeScript", "JavaScript", "Accessibility", "Performance", "Healthcare UI", "Medical Forms"],
          linkBios: "https://bios.co/isabella-morales"
        },
        {
          name: "Lucía Mendoza",
          role: "Frontend Developer",
          tags: ["React", "JavaScript", "Figma", "Performance", "Responsive Design", "Digital Signature UI", "Document Management"],
          linkBios: "https://bios.co/lucia-mendoza"
        },
        {
          name: "Florencia Ortiz",
          role: "Frontend Developer",
          tags: ["React", "TypeScript", "JavaScript", "Figma", "State Management", "Billing Interfaces", "Invoice Management"],
          linkBios: "https://bios.co/florencia-ortiz"
        },
        {
          name: "Marcelo Fernandez",
          role: "Frontend Developer",
          tags: ["React", "TypeScript", "JavaScript", "Figma", "UI/UX", "Accessibility", "Performance Optimization"],
          linkBios: "https://bios.co/marcelo-fernandez"
        },
        {
          name: "Ana Paula Costa",
          role: "Frontend Developer",
          tags: ["React", "TypeScript", "JavaScript", "Figma", "UI/UX", "Mobile-First Design", "Progressive Web Apps"],
          linkBios: "https://bios.co/ana-paula-costa"
        },
        {
          name: "Fernando Silva",
          role: "Frontend Developer",
          tags: ["React", "TypeScript", "JavaScript", "Figma", "UI/UX", "Animation", "Interactive Design"],
          linkBios: "https://bios.co/fernando-silva"
        },

        # === DEVOPS ===
        {
          name: "Nicolás Herrera",
          role: "DevOps",
          tags: ["Docker", "AWS", "Kubernetes", "Terraform", "Infrastructure"],
          linkBios: "https://bios.co/nicolas-herrera"
        },
        {
          name: "Gabriel Torres",
          role: "DevOps",
          tags: ["Docker", "AWS", "Monitoring", "Automation", "Scalability"],
          linkBios: "https://bios.co/gabriel-torres"
        },
        {
          name: "Agustín Moreno",
          role: "DevOps",
          tags: ["Docker", "AWS", "PostgreSQL", "Kubernetes", "Performance"],
          linkBios: "https://bios.co/agustin-moreno"
        },

        # === QA & TESTING ===
        {
          name: "Diego Ramírez",
          role: "QA",
          tags: ["Test Strategy", "Performance Testing", "Security Testing", "API Testing", "Test Leadership", "Healthcare Compliance", "HIPAA Testing"],
          linkBios: "https://bios.co/diego-ramirez"
        },
        {
          name: "Mateo Rojas",
          role: "QA",
          tags: ["QA Leadership", "Test Strategy", "Quality Processes", "Team Management", "Automation", "Financial Testing", "Payment Gateway Testing"],
          linkBios: "https://bios.co/mateo-rojas"
        },
        {
          name: "Daniela Vargas",
          role: "QA",
          tags: ["Cypress", "Xray", "Test Automation", "API Testing", "Quality Assurance", "E-learning Testing", "LMS Validation"],
          linkBios: "https://bios.co/daniela-vargas"
        },
        {
          name: "Andrés Herrera",
          role: "QA",
          tags: ["Quality Assurance", "Test Automation", "Manual Testing", "Agile Testing", "Quality Processes"],
          linkBios: "https://bios.co/andres-herrera"
        },
        {
          name: "Carlos Herrera",
          role: "QA",
          tags: ["Quality Assurance", "Test Automation", "Manual Testing", "Agile Testing", "Quality Processes"],
          linkBios: "https://bios.co/carlos-herrera"
        },

        # === DESIGNERS ===
        {
          name: "Renata Silva",
          role: "Designer",
          tags: ["UI/UX Design", "Figma", "Design Systems", "User Research", "Prototyping"],
          linkBios: "https://bios.co/renata-silva"
        },
        {
          name: "Carmen Silva",
          role: "Designer",
          tags: ["UI/UX Design", "Figma", "Prototyping", "Accessibility", "Visual Design"],
          linkBios: "https://bios.co/carmen-silva"
        },
        {
          name: "Ana Belén Acosta",
          role: "Designer",
          tags: ["Figma", "User Research", "Prototyping", "Design Systems", "UI/UX Design"],
          linkBios: "https://bios.co/ana-belen-acosta"
        }
      ]
    end

    def bios_details(profiles)
      profiles.map do |profile|
        {
          employee: {
            fullName: profile[:name],
            role: { name: profile[:role] },
            seniority: generate_seniority(profile[:role]),
            skills: profile[:tags] + generate_additional_skills(profile[:role]),
            experience: generate_experience(profile[:role]),
            projects: generate_projects(profile[:role]),
            industries: generate_industries(profile[:name], profile[:role]),
            languages: generate_languages(profile[:name]),
            bio: generate_bio(profile[:name], profile[:role])
          },
          additionalContext: {
            avatar_url: "https://bios.co/avatars/#{profile[:name].downcase.gsub(' ', '-')}.jpg"
          }
        }
      end
    end

    private

    def generate_seniority(role)
      case role
      when /Technical Lead|Product Manager|Project Manager/
        "Senior"
      when /Full Stack/
        "Mid-Senior"
      else
        "Mid"
      end
    end

    def generate_additional_skills(role)
      case role
      when /Backend/
        ["REST APIs", "Database Design", "System Architecture", "Code Review", "Agile Development", "Hotwire", "PostgreSQL"]
      when /Frontend/
        ["Responsive Design", "State Management", "Build Tools", "Accessibility", "Performance Optimization", "TypeScript"]
      when /Full Stack/
        ["System Design", "Code Review", "Mentoring", "Technical Leadership", "Agile Development", "React", "PostgreSQL"]
      when /DevOps/
        ["Infrastructure as Code", "Security", "Monitoring", "Automation", "Cloud Architecture", "Docker", "Terraform"]
      when /QA/
        ["Test Planning", "Bug Tracking", "Quality Assurance", "Agile Testing", "Automation", "Cypress", "Xray"]
      when /Product Manager/
        ["Market Research", "Competitive Analysis", "Product Launch", "User Research", "Data Analysis", "Roadmapping"]
      when /Scrum Master/
        ["Sprint Planning", "Retrospectives", "Team Building", "Agile Coaching", "Process Improvement", "Scrum"]
      when /Project Manager|Delivery Manager/
        ["Resource Allocation", "Communication", "Documentation", "Client Relations", "Risk Management", "Agile"]
      when /Designer|Design Manager/
        ["Visual Design", "Interaction Design", "Design Systems", "User Research", "Prototyping", "Figma", "Adobe Suite"]
      when /Engineer|Architect|Technical/
        ["Technical Leadership", "System Architecture", "Code Review", "Mentoring", "Best Practices", "Ruby on Rails"]
      else
        ["Problem Solving", "Team Collaboration", "Agile", "Continuous Learning", "Innovation"]
      end
    end

    def generate_experience(role)
      case role
      when /Senior|Principal|Staff|Manager|Lead|Architect/
        "6+ years"
      when /Full Stack|Semi Senior/
        "4+ years"
      else
        "3+ years"
      end
    end

    def generate_projects(role)
      case role
      when /Backend/
        [
          "Scaled MasterClass to millions of users and billions of views",
          "Migrated database to comply with GDPR requirements",
          "Stabilized mission-critical Rails application with performance issues",
          "Built scalable REST API serving 1M+ requests/day",
          "Implemented caching layer reducing response time by 60%"
        ]
      when /Frontend/
        [
          "Developed responsive web app with 99.9% uptime",
          "Optimized bundle size reducing load time by 40%",
          "Implemented accessibility features for WCAG 2.1 compliance",
          "Built progressive web app for mobile-first experience",
          "Created interactive dashboard for real-time analytics"
        ]
      when /Full Stack/
        [
          "Built end-to-end SaaS platform with 50k+ users",
          "Migrated monolithic app to microservices architecture",
          "Implemented real-time features using WebSockets",
          "Developed full-stack solution for healthcare management",
          "Created comprehensive e-learning platform with video streaming"
        ]
      when /DevOps/
        [
          "Set up CI/CD pipeline reducing deployment time by 80%",
          "Implemented infrastructure monitoring and alerting",
          "Led security audit and compliance implementation",
          "Migrated legacy systems to cloud infrastructure",
          "Established disaster recovery procedures for critical systems"
        ]
      when /QA/
        [
          "Implemented automated testing suite reducing bug reports by 70%",
          "Led performance testing for high-traffic e-commerce platform",
          "Established QA processes improving release quality by 85%",
          "Created comprehensive test strategy for mobile applications",
          "Implemented security testing protocols for financial applications"
        ]
      when /Product Manager/
        [
          "Launched successful SaaS product with 10k+ active users",
          "Led product strategy for mobile app achieving 4.5-star rating",
          "Managed product roadmap delivering 12 major features on time",
          "Pioneered AI-powered recommendation system for e-commerce",
          "Developed B2B product strategy increasing revenue by 200%"
        ]
      when /Scrum Master/
        [
          "Coached 3 development teams improving velocity by 40%",
          "Facilitated successful agile transformation for 50-person organization",
          "Implemented Scrum practices reducing sprint delays by 60%",
          "Led cross-functional team through major platform migration",
          "Established agile practices for distributed team across 4 time zones"
        ]
      when /Project Manager|Delivery Manager/
        [
          "Managed $2M software development project delivered on time and budget",
          "Led cross-functional team of 15 developers across 3 time zones",
          "Implemented project management tools improving team productivity by 35%",
          "Coordinated international team for global product launch",
          "Managed complex integration project with 5 external vendors"
        ]
      when /Designer|Design Manager/
        [
          "Designed user interface for award-winning mobile application",
          "Created design system used across 5 product teams",
          "Led user research initiatives improving user satisfaction by 45%",
          "Redesigned e-commerce platform increasing conversion by 30%",
          "Developed brand identity and design guidelines for startup"
        ]
      when /Engineer|Architect|Technical/
        [
          "Led technical architecture for enterprise-scale application",
          "Mentored 10+ junior developers improving team capabilities",
          "Established coding standards and best practices across organization",
          "Designed scalable system architecture supporting 100k+ users",
          "Contributed to open-source projects and Ruby community"
        ]
      else
        [
          "Contributed to open-source projects",
          "Mentored junior team members",
          "Participated in cross-functional initiatives"
        ]
      end
    end

    def generate_industries(name, role)
      # Assign diverse industries based on role and experience level for variety
      case role
      when /Backend/
        ["SaaS", "E-commerce", "Media & Video", "Fintech"]
      when /Frontend/
        ["SaaS", "Media & Video", "E-commerce", "Content"]
      when /Full Stack/
        ["SaaS", "Healthcare", "Education", "E-commerce"]
      when /DevOps/
        ["SaaS", "Fintech", "Media & Video", "Security"]
      when /QA/
        ["SaaS", "E-commerce", "Healthcare", "Media & Video"]
      when /Product Manager/
        ["SaaS", "E-commerce", "Fintech", "Healthcare", "Media & Video"]
      when /Scrum Master/
        ["SaaS", "Technology", "Consulting", "Startups"]
      when /Project Manager|Delivery Manager/
        ["SaaS", "Technology", "Healthcare", "Education", "Media & Video"]
      when /Designer|Design Manager/
        ["SaaS", "E-commerce", "Media & Video", "Healthcare", "Content"]
      when /Engineer|Architect|Technical/
        ["SaaS", "Technology", "Startups", "Media & Video"]
      else
        ["SaaS", "Technology", "Startups", "Media & Video"]
      end
    end

    def generate_languages(name)
      ["English", "Spanish"]
    end

    def generate_bio(name, role)
      seniority = generate_seniority(role)
      experience = generate_experience(role)
      
      "#{seniority} #{role.downcase} with #{experience} of experience in building scalable web applications. " \
      "Passionate about clean code, performance optimization, and delivering exceptional user experiences. " \
      "Experienced in agile methodologies and cross-functional team collaboration."
    end
  end
end
