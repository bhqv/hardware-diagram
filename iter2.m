flowchart LR
    subgraph Recording["Data Collection"]
        A[Mobile App Recording] --> B[Real Audio]
        B --> Q[RealAudios/]
        Q --> C[Directory Structure]
        C -->|Speaker1| D[speaker1_recordings/*.wav]
        C -->|Speaker2| E[speaker2_recordings/*.wav]
        C -->|Speaker3| F[speaker3_recordings/*.wav]
    end

    subgraph AudioProcessing["Audio Processing"]
        B --> G[FFmpeg Processing]
        G -->|Convert to| H["PCM Format
        16-bit little-endian
        16 kHz, mono"]
    end

    subgraph Transcription["Speech Recognition"]
        H --> I[Whisper Model]
        I --> J[Text Transcripts]
    end

    subgraph DeepfakeGeneration["Deepfake Generation"]
        J --> K[Text-to-Speech Model]
        K --> L[Synthetic Audio]
        
        subgraph Processing["Audio Post-Processing"]
            L --> M[Noise Addition]
            L --> N[Volume Normalization]
            M --> O[Final Fake Audio]
            N --> O
        end
    end

    subgraph DatasetOrganization["Final Dataset"]
        O --> P[DeepfakedAudios/]
    end

    style Recording fill:#f9f9f9
    style AudioProcessing fill:#e6f3ff
    style Transcription fill:#e6ffe6
    style DeepfakeGeneration fill:#ffe6e6
    style DatasetOrganization fill:#f0f0f0
